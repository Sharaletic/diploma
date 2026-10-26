import '../../ui_kit.dart';

class ButtonsPreview extends StatelessWidget {
  const ButtonsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const RepaintBoundary(
      child: Column(
        spacing: 16,
        children: [
          _PrimaryButton(),
          // _SecondaryButton(),
          // _TextButton(),
          // _DangerButton(),
        ],
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typography = theme.appTypography;

    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .stretch,
      children: [
        UiText('Primary', typography.h3),
        const SizedBox(height: 16),
        UiButton.primaryLG(onPressed: () {}, label: const Text('Продолжить')),
        const SizedBox(height: 8),
        UiButton.primaryLG(onPressed: null, label: const Text('Продолжить')),
        const SizedBox(height: 8),
        UiButton.primaryLG(
          onPressed: () {},
          isLoading: true,
          label: const Text('Продолжить'),
        ),
        const SizedBox(height: 20),
        UiText('Secondary', typography.h3),
        const SizedBox(height: 16),
        Align(
          alignment: .center,
          child: UiButton.secondary(
            onPressed: () {},
            label: const Text('Получить новый код'),
          ),
        ),
        const SizedBox(height: 20),
        UiText('Text Button', typography.h3),
        const SizedBox(height: 16),
        Align(
          alignment: .center,
          child: UiButton.text(
            onPressed: () {},
            label: const Text('Использовать другой номер'),
          ),
        ),
      ],
    );
  }
}
