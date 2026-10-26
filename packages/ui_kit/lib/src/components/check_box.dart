import '../../ui_kit.dart';

class UiCheckBox extends StatelessWidget {
  const UiCheckBox({
    super.key,
    required this.title,
    required this.value,
    required this.onChange,
    this.isError = false,
    this.enabled = true,
  });
  final String title;
  final bool value;
  final Function(bool isChecked) onChange;
  final bool isError;
  final bool enabled;

  void _handleTap() {
    if (!enabled) return;
    onChange(!value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final palette = theme.appColorPalette;
    final typography = theme.appTypography;

    return Semantics(
      checked: value,
      enabled: enabled,
      label: title,
      onTap: enabled ? _handleTap : null,
      container: true,
      child: GestureDetector(
        behavior: .opaque,
        onTap: _handleTap,
        child: Row(
          mainAxisSize: .min,
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: .start,
          spacing: 8,
          children: [
            Flexible(
              child: UiText(
                title,
                typography.body2.copyWith(
                  color: enabled ? palette.ink : palette.ink1,
                ),
              ),
            ),
            SizedBox.square(
              dimension: 18,
              child: IgnorePointer(
                child: Checkbox(
                  isError: isError,
                  checkColor: palette.ink3,
                  shape: RoundedRectangleBorder(borderRadius: .circular(4)),
                  side: switch ((value, isError, enabled)) {
                    (_, _, false) => BorderSide(color: palette.surface2),
                    (true, _, _) => BorderSide(color: palette.accent),
                    (false, true, _) => BorderSide(color: palette.danger),
                    (false, false, true) => BorderSide(color: palette.ink1),
                  },
                  value: value,
                  onChanged: enabled ? (_) {} : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
