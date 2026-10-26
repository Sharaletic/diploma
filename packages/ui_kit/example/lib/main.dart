import 'package:ui_kit/ui_kit.dart';

final theme = createThemeData(
  palette: defaultColorPalette,
  typography: defaultTypography,
);

void main() {
  runApp(const UiKit());
}

class UiKit extends StatelessWidget {
  const UiKit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      builder: (context, child) {
        final gradient = Theme.of(context).appGradient;
        return Container(
          decoration: BoxDecoration(gradient: gradient.backgroundGradient),
          child: child,
        );
      },
      home: const UiPreview(),
    );
  }
}

class UiPreview extends StatelessWidget {
  const UiPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typography = theme.appTypography;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const .all(16),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const .symmetric(horizontal: 16, vertical: 24),
                sliver: SliverList.list(
                  children: [
                    Align(
                      alignment: .center,
                      child: UiText('Buttons'.toUpperCase(), typography.h1),
                    ),
                    const SizedBox(height: 20),
                    const ButtonsPreview(),
                    const SizedBox(height: 32),
                    Align(
                      alignment: .center,
                      child: UiText('Text Fields'.toUpperCase(), typography.h1),
                    ),
                    const SizedBox(height: 20),
                    const TextFieldsPreview(),
                    const SizedBox(height: 32),
                    Align(
                      alignment: .center,
                      child: UiText('Check Boxes'.toUpperCase(), typography.h1),
                    ),
                    const SizedBox(height: 20),
                    const CheckBoxPreview(),
                    const SizedBox(height: 32),
                    Align(
                      alignment: .center,
                      child: UiText('Otp Input'.toUpperCase(), typography.h1),
                    ),
                    const SizedBox(height: 20),
                    const OtpInputPreview(),
                    const SizedBox(height: 32),
                    Align(
                      alignment: .center,
                      child: UiText('Cards'.toUpperCase(), typography.h1),
                    ),
                    const SizedBox(height: 20),
                    const CardsPreview(),
                    const SizedBox(height: 32),
                    Align(
                      alignment: .center,
                      child: UiText(
                        'Modal Bottom Sheet'.toUpperCase(),
                        typography.h1,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const ModalBottomSheetPreview(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
