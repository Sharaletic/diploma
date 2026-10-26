import 'package:ui_kit/ui_kit.dart';

class UiErrorCard extends StatelessWidget {
  const UiErrorCard({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final palette = theme.appColorPalette;
    final typography = theme.appTypography;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.danger.withValues(alpha: 0.12),
        borderRadius: UiBorderRadius.mediumBorderRadius,
        border: .all(color: palette.danger, width: 1.7),
      ),
      child: Padding(
        padding: const .symmetric(vertical: 8, horizontal: 16),
        child: UiText(message, typography.caption2),
      ),
    );
  }
}
