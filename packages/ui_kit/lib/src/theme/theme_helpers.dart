import '../../ui_kit.dart';

final defaultColorPalette = _colorPalette;
final defaultTypography = _typography;

ThemeData createThemeData({
  required ColorPalette palette,
  required AppTypography typography,
}) {
  final colorScheme = ColorScheme.fromSeed(
    brightness: .dark,
    seedColor: palette.accent,
    primary: palette.accent,
    error: palette.danger,
    onError: palette.danger,
    surface: palette.surface,
    onSurface: palette.ink,
  );

  return ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    brightness: .dark,
    colorScheme: colorScheme,
    extensions: [
      palette,
      typography,
      AppGradinet.fromPalette(palette: palette),
    ],
  );
}

final _colorPalette = const ColorPalette(
  topGradientBg: Color(0xFF0C1823),
  bottomGradientBg: Color(0xFF000000),
  accent: Color(0xFF10DC8E),
  surface: Color(0xFFFFFFFF),
  surface1: Color(0xFFB6B7B9),
  surface2: Color(0xFF959597),
  ink: Color(0xFFFFFFFF),
  ink1: Color(0xFFB3B4B8),
  ink2: Color(0xFF6E6E6E),
  ink3: Color(0xFF000000),
  border: Color(0xFF5B5B5C),
  danger: Color(0xFFB00020),
  backgroundBottomSheet: Color(0xFF1C1C1E),
);

final _typography = AppTypography(
  h1: factCompressedBold(44, null, _colorPalette.ink).copyWith(height: 1.2),
  h2: honor(27, .w900, _colorPalette.ink).copyWith(height: 1.2),
  h3: honor(24, .w900, _colorPalette.ink),
  subtitle: honorNormal(15, .w600, _colorPalette.ink1),
  primaryButtonTitle: fact(14, .w500, _colorPalette.ink3),
  secondaryButtonTitle: honorNormal(13, .w700, _colorPalette.surface1),
  textButtonTitle: honorNormal(15, .w900, _colorPalette.ink),
  labelOutlinedTextField: honorNormal(20, .w900, _colorPalette.ink),
  labelUnderlinedTextField: honorNormal(14, .w700, _colorPalette.ink),
  hintField: honorNormal(14, .w600, _colorPalette.ink1),
  textField: honorNormal(14, .w600, _colorPalette.ink),
  body1: honorNormal(15, .w900, _colorPalette.ink),
  body2: honorNormal(15, .w500, _colorPalette.ink1),
  caption1: honorNormal(14, .w500, _colorPalette.danger),
  caption2: honorNormal(12, .w600, _colorPalette.danger),
);
