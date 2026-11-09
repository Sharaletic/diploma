import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../../core/context_extension.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/utils/error.dart';
import '../authentication.dart';

class FormContent extends StatefulWidget {
  const FormContent({super.key});

  @override
  State<FormContent> createState() => _FormContentState();
}

class _FormContentState extends State<FormContent> with _FormStateMixin {
  @override
  Widget build(BuildContext context) {
    final l10n = context.localizations;
    final typography = context.typography;

    return BlocListener<AuthSessionBloc, AuthSessionState>(
      listener: (context, state) {
        if (ModalRoute.of(context)?.isCurrent != true) return;
        state.mapOrNull(
          challengeCreated: (state) => context.router.push(PinCodeRoute()),
          rateLimited: (state) => ErrorUtil.displayErrorSnackBar(
            context,
            l10n.resendCodeIn(_format(state.retryAfter)),
          ),
          attemptsExceeded: (state) => ErrorUtil.displayErrorSnackBar(
            context,
            l10n.tooManyAttemptsCallAvailableIn(_format(state.retryAfter)),
          ),
          failed: (state) =>
              ErrorUtil.displayErrorSnackBar(context, state.error),
        );
      },
      child: GestureDetector(
        behavior: .opaque,
        onTap: () => _focusNode.unfocus(),
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .stretch,
          children: [
            PhoneInput(controller: _phoneController, focusNode: _focusNode),
            const SizedBox(height: 24),
            UiText(l10n.privacyPolicy.toUpperCase(), typography.body1),
            const SizedBox(height: 6),
            ValueListenableBuilder(
              valueListenable: _isAgree,
              builder: (context, _, child) => UiCheckBox(
                title: l10n.personalDataConsent,
                value: _isAgree.value,
                onChange: (value) => _isAgree.value = value,
              ),
            ),
            const SizedBox(height: 180),
            BlocBuilder<AuthSessionBloc, AuthSessionState>(
              buildWhen: (prev, curr) => prev is Loading || curr is Loading,
              builder: (context, state) {
                final isLoading = state is Loading;
                return ListenableBuilder(
                  listenable: _canSubmitListenable,
                  builder: (context, _) {
                    final canSubmit =
                        _isValid.value && _isAgree.value && !isLoading;
                    return Align(
                      alignment: .center,
                      child: UiButton.primarySM(
                        label: Text(l10n.getCode),
                        isLoading: isLoading,
                        onPressed: canSubmit ? _onSubmit : null,
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

mixin _FormStateMixin on State<FormContent> {
  late final TextEditingController _phoneController;
  late final FocusNode _focusNode;
  late final ValueNotifier<bool> _isValid;
  late final ValueNotifier<bool> _isAgree;
  late final Listenable _canSubmitListenable;
  late final CountdownCubit countdownCubit;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _focusNode = FocusNode();
    _isAgree = ValueNotifier<bool>(false);
    _isValid = ValueNotifier<bool>(false);
    _phoneController.addListener(_onTextChanged);
    _canSubmitListenable = .merge([_isValid, _isAgree]);
  }

  @override
  void dispose() {
    _phoneController.removeListener(_onTextChanged);
    _phoneController.dispose();
    _focusNode.dispose();
    _isValid.dispose();
    _isAgree.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final isValid = PhoneInputValidator.validate(_phoneController.text);
    if (_isValid.value == isValid) return;
    _isValid.value = isValid;

    if (isValid) _focusNode.unfocus();
  }

  void _onSubmit() {
    final digits = _phoneController.text.replaceAll(RegExp(r'\D'), '');
    final phone = '+7$digits';

    context.read<AuthSessionBloc>().add(
      AuthSessionEvent.createChallenge(
        phone: phone,
        personalDataConsent: _isAgree.value,
      ),
    );
  }

  String _format(Duration d) {
    String two(int n) => n.toString().padLeft(2, '0');
    final m = two(d.inMinutes.remainder(60));
    final s = two(d.inSeconds.remainder(60));
    return d.inHours > 0 ? '${d.inHours}:$m:$s' : '$m:$s';
  }
}
