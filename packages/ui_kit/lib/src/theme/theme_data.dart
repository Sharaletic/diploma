import 'package:flutter/foundation.dart';
import '../../ui_kit.dart';

class ColorPalette extends ThemeExtension<ColorPalette> {
  const ColorPalette({
    required this.topGradientBg,
    required this.bottomGradientBg,
    required this.accent,
    required this.surface,
    required this.surface1,
    required this.surface2,
    required this.ink,
    required this.ink1,
    required this.ink2,
    required this.ink3,
    required this.border,
    required this.danger,
    required this.backgroundBottomSheet,
  });

  final Color topGradientBg;
  final Color bottomGradientBg;
  final Color accent;
  final Color surface;
  final Color surface1;
  final Color surface2;
  final Color ink;
  final Color ink1;
  final Color ink2;
  final Color ink3;
  final Color border;
  final Color danger;
  final Color backgroundBottomSheet;

  @override
  ThemeExtension<ColorPalette> copyWith({
    Color? topGradientBg,
    Color? bottomGradientBg,
    Color? accent,
    Color? surface,
    Color? surface1,
    Color? surface2,
    Color? ink,
    Color? ink1,
    Color? ink2,
    Color? ink3,
    Color? border,
    Color? danger,
    Color? backgroundBottomSheet,
  }) => ColorPalette(
    topGradientBg: topGradientBg ?? this.topGradientBg,
    bottomGradientBg: bottomGradientBg ?? this.bottomGradientBg,
    accent: accent ?? this.accent,
    surface: surface ?? this.surface,
    surface1: surface1 ?? this.surface1,
    surface2: surface2 ?? this.surface2,
    ink: ink ?? this.ink,
    ink1: ink1 ?? this.ink1,
    ink2: ink2 ?? this.ink2,
    ink3: ink3 ?? this.ink3,
    border: border ?? this.border,
    danger: danger ?? this.danger,
    backgroundBottomSheet: backgroundBottomSheet ?? this.backgroundBottomSheet,
  );

  @override
  ThemeExtension<ColorPalette> lerp(
    covariant ThemeExtension<ColorPalette>? other,
    double t,
  ) {
    if (other == null || other is! ColorPalette) {
      return this;
    }

    return ColorPalette(
      topGradientBg: Color.lerp(topGradientBg, other.topGradientBg, t)!,
      bottomGradientBg: Color.lerp(
        bottomGradientBg,
        other.bottomGradientBg,
        t,
      )!,
      accent: Color.lerp(accent, other.accent, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surface1: Color.lerp(surface1, other.surface1, t)!,
      surface2: Color.lerp(surface2, other.surface2, t)!,
      ink: Color.lerp(ink, other.ink, t)!,
      ink1: Color.lerp(ink1, other.ink1, t)!,
      ink2: Color.lerp(ink2, other.ink2, t)!,
      ink3: Color.lerp(ink3, other.ink3, t)!,
      border: Color.lerp(border, other.border, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      backgroundBottomSheet: Color.lerp(
        backgroundBottomSheet,
        other.backgroundBottomSheet,
        t,
      )!,
    );
  }

  List<Object?> get _props => [
    topGradientBg,
    bottomGradientBg,
    accent,
    surface,
    surface1,
    surface2,
    ink,
    ink1,
    ink2,
    ink3,
    border,
    danger,
    backgroundBottomSheet,
  ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorPalette && listEquals(_props, other._props);

  @override
  int get hashCode => Object.hashAll(_props);
}

class AppTypography extends ThemeExtension<AppTypography> {
  const AppTypography({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.subtitle,
    required this.primaryButtonTitle,
    required this.secondaryButtonTitle,
    required this.textButtonTitle,
    required this.labelOutlinedTextField,
    required this.labelUnderlinedTextField,
    required this.hintField,
    required this.textField,
    required this.body1,
    required this.body2,
    required this.caption1,
    required this.caption2,
  });
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle subtitle;
  final TextStyle primaryButtonTitle;
  final TextStyle secondaryButtonTitle;
  final TextStyle textButtonTitle;
  final TextStyle labelOutlinedTextField;
  final TextStyle labelUnderlinedTextField;
  final TextStyle hintField;
  final TextStyle textField;
  final TextStyle body1;
  final TextStyle body2;

  final TextStyle caption1;
  final TextStyle caption2;

  @override
  ThemeExtension<AppTypography> copyWith({
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? subtitle,
    TextStyle? primaryButtonTitle,
    TextStyle? secondaryButtonTitle,
    TextStyle? textButtonTitle,
    TextStyle? labelOutlinedTextField,
    TextStyle? labelUnderlinedTextField,
    TextStyle? hintField,
    TextStyle? textField,
    TextStyle? body1,
    TextStyle? body2,
    TextStyle? caption1,
    TextStyle? caption2,
  }) => AppTypography(
    h1: h1 ?? this.h1,
    h2: h2 ?? this.h2,
    h3: h3 ?? this.h3,
    subtitle: subtitle ?? this.subtitle,
    primaryButtonTitle: primaryButtonTitle ?? this.primaryButtonTitle,
    secondaryButtonTitle: secondaryButtonTitle ?? this.secondaryButtonTitle,
    textButtonTitle: textButtonTitle ?? this.textButtonTitle,
    labelOutlinedTextField:
        labelOutlinedTextField ?? this.labelOutlinedTextField,
    labelUnderlinedTextField:
        labelUnderlinedTextField ?? this.labelUnderlinedTextField,
    hintField: hintField ?? this.hintField,
    textField: textField ?? this.textField,
    body1: body1 ?? this.body1,
    body2: body2 ?? this.body2,
    caption1: caption1 ?? this.caption1,
    caption2: caption2 ?? this.caption2,
  );

  @override
  ThemeExtension<AppTypography> lerp(
    covariant ThemeExtension<AppTypography>? other,
    double t,
  ) {
    if (other == null || other is! AppTypography) {
      return this;
    }

    return AppTypography(
      h1: TextStyle.lerp(h1, other.h1, t)!,
      h2: TextStyle.lerp(h2, other.h2, t)!,
      h3: TextStyle.lerp(h3, other.h3, t)!,
      subtitle: TextStyle.lerp(subtitle, other.subtitle, t)!,
      primaryButtonTitle: TextStyle.lerp(
        primaryButtonTitle,
        other.primaryButtonTitle,
        t,
      )!,
      secondaryButtonTitle: TextStyle.lerp(
        secondaryButtonTitle,
        other.secondaryButtonTitle,
        t,
      )!,
      textButtonTitle: TextStyle.lerp(
        textButtonTitle,
        other.textButtonTitle,
        t,
      )!,
      labelOutlinedTextField: TextStyle.lerp(
        labelOutlinedTextField,
        other.labelOutlinedTextField,
        t,
      )!,
      labelUnderlinedTextField: TextStyle.lerp(
        labelUnderlinedTextField,
        other.labelUnderlinedTextField,
        t,
      )!,
      hintField: TextStyle.lerp(hintField, other.hintField, t)!,
      textField: TextStyle.lerp(textField, other.textField, t)!,
      body1: TextStyle.lerp(body1, other.body1, t)!,
      body2: TextStyle.lerp(body2, other.body2, t)!,
      caption1: TextStyle.lerp(caption1, other.caption1, t)!,
      caption2: TextStyle.lerp(caption2, other.caption2, t)!,
    );
  }

  List<Object?> get _props => [
    h1,
    h2,
    h3,
    subtitle,
    primaryButtonTitle,
    secondaryButtonTitle,
    labelOutlinedTextField,
    labelUnderlinedTextField,
    hintField,
    body1,
    body2,
    caption1,
    caption2,
  ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppTypography && listEquals(_props, other._props);

  @override
  int get hashCode => Object.hashAll(_props);
}

extension ThemeDataExtensions on ThemeData {
  ColorPalette get appColorPalette =>
      extension<ColorPalette>() ?? defaultColorPalette;

  AppTypography get appTypography =>
      extension<AppTypography>() ?? defaultTypography;

  AppGradinet get appGradient =>
      extension<AppGradinet>() ??
      AppGradinet.fromPalette(palette: appColorPalette);
}
