import 'package:auto_route/auto_route.dart';
import 'package:diploma/core/context_extension.dart';
import 'package:ui_kit/ui_kit.dart';

import '../authentication.dart';

@RoutePage()
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.localizations;
    final typography = context.typography;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const .only(top: 120, left: 24, right: 24, bottom: 34),
                child: Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    UiText(
                      l10n.loginTitle.toUpperCase(),
                      typography.h1,
                      textAlign: .center,
                    ),
                    const SizedBox(height: 12),
                    UiText(
                      l10n.phoneLoginDescription,
                      typography.subtitle,
                      textAlign: .center,
                    ),
                    const Spacer(),
                    UiButton.primaryLG(
                      label: Text(l10n.start),
                      onPressed: () => showUiModalBottomSheet(
                        context: context,
                        barrierColor: Colors.transparent,
                        builder: (_) => UiModalBottomSheet(
                          title: l10n.phoneNumberHint,
                          content: FormContent(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
