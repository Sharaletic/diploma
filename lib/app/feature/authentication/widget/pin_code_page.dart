import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../../core/context_extension.dart';
import '../../../../core/utils/error.dart';
import '../authentication.dart';

@RoutePage()
class PinCodePage extends StatefulWidget implements AutoRouteWrapper {
  const PinCodePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) =>
      BlocProvider(create: (_) => CountdownCubit(), child: this);

  @override
  State<PinCodePage> createState() => _PinCodePageState();
}

class _PinCodePageState extends State<PinCodePage> with _PinCodePageStateMixin {
  @override
  Widget build(BuildContext context) {
    final l10n = context.localizations;
    final typography = context.typography;

    return BlocConsumer<AuthSessionBloc, AuthSessionState>(
      listener: (context, state) {
        switch (state) {
          case InvalidCode(:final retryAfter) || RateLimited(:final retryAfter):
            _codeController.clear();
            context.read<CountdownCubit>().start(retryAfter);
          case Failed(:final error):
            ErrorUtil.displayErrorSnackBar(context, error);
          default:
        }
      },
      builder: (context, state) {
        return BlocBuilder<CountdownCubit, Duration>(
          builder: (context, left) {
            return ListenableBuilder(
              listenable: _codeController,
              builder: (context, _) {
                final isBlocked = state is RateLimited && left > .zero;
                final showInvalid =
                    state is InvalidCode && _codeController.text.isEmpty;

                final errorText = switch (state) {
                  InvalidCode(:final attemptsRemaining) when showInvalid =>
                    l10n.invalidCodeAttemptsRemaining(attemptsRemaining),
                  RateLimited(:final retryAfter) when isBlocked =>
                    l10n.tooManyAttemptsCallAvailableIn(_format(retryAfter)),
                  _ => null,
                };

                final hasError = isBlocked || showInvalid;
                final enabled = !isBlocked;

                return Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: SafeArea(
                    child: Padding(
                      padding: .only(top: 120, left: 24, right: 24, bottom: 34),
                      child: Column(
                        crossAxisAlignment: .stretch,
                        children: [
                          UiText(
                            l10n.enterVerificationCode,
                            typography.h2,
                            textAlign: .center,
                          ),
                          const SizedBox(height: 16),
                          UiOtpInput(
                            controller: _codeController,
                            isError: hasError,
                            isEnabled: enabled,
                          ),
                          if (isBlocked && errorText != null) ...[
                            const SizedBox(height: 16),
                            UiErrorCard(message: errorText),
                          ],
                          if (showInvalid && errorText != null) ...[
                            const SizedBox(height: 6),
                            UiText(errorText, typography.caption1),
                          ],
                          if (left <= .zero || state is! RateLimited) ...[
                            const SizedBox(height: 30),
                            Align(
                              alignment: .center,
                              child: UiButton.secondary(
                                label: Text(l10n.getCode),
                                isLoading: state is Loading,
                                onPressed: () => context
                                    .read<AuthSessionBloc>()
                                    .add(AuthSessionEvent.resendCode()),
                              ),
                            ),
                          ],
                          if (left > .zero && state is! RateLimited) ...[
                            const SizedBox(height: 16),
                            UiText(
                              l10n.resendCodeIn(_format(left)),
                              typography.body1,
                            ),
                          ],
                          const Spacer(),
                          ValueListenableBuilder(
                            valueListenable: _isValid,
                            builder: (context, _, child) => UiButton.primaryLG(
                              label: Text(l10n.continueButton),
                              onPressed: _isValid.value && !isBlocked
                                  ? () => _onVerifyCode(context)
                                  : null,
                            ),
                          ),
                          const SizedBox(height: 40),
                          Align(
                            alignment: .center,
                            child: UiButton.text(
                              onPressed: () => context.router.pop(),
                              label: Text(l10n.useAnotherPhoneNumber),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

mixin _PinCodePageStateMixin on State<PinCodePage> {
  late final TextEditingController _codeController;
  late final ValueNotifier<bool> _isValid;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController();
    _codeController.addListener(_onTextChanged);
    _isValid = ValueNotifier<bool>(false);

    final cubit = context.read<CountdownCubit>();
    switch (context.read<AuthSessionBloc>().state) {
      case ChallengeCreated(:final challenge):
        cubit.start(challenge.resendAfter);
      case RateLimited(:final retryAfter):
        cubit.start(retryAfter);
      default:
    }
  }

  @override
  void dispose() {
    _codeController.dispose();
    _isValid.dispose();
    _codeController.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    final isValid = PinCodeValidator.validate(_codeController.text);
    if (_isValid.value == isValid) return;
    _isValid.value = isValid;
  }

  void _onVerifyCode(BuildContext context) {
    context.read<AuthSessionBloc>().add(
      AuthSessionEvent.verifyCode(code: _codeController.text),
    );
  }

  String _format(Duration d) {
    String two(int n) => n.toString().padLeft(2, '0');
    final m = two(d.inMinutes.remainder(60));
    final s = two(d.inSeconds.remainder(60));
    return d.inHours > 0 ? '${d.inHours}:$m:$s' : '$m:$s';
  }
}
