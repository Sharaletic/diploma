import '../../ui_kit.dart';

class AppGradinet extends ThemeExtension<AppGradinet> {
  const AppGradinet({required this.backgroundGradient});

  factory AppGradinet.fromPalette({required ColorPalette palette}) =>
      AppGradinet(
        backgroundGradient: LinearGradient(
          begin: .topCenter,
          end: .bottomCenter,
          stops: const [0.0, 1.0],
          colors: [palette.topGradientBg, palette.bottomGradientBg],
        ),
      );

  final LinearGradient backgroundGradient;

  @override
  ThemeExtension<AppGradinet> copyWith({LinearGradient? backgroundGradient}) {
    return AppGradinet(
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
    );
  }

  @override
  ThemeExtension<AppGradinet> lerp(
    covariant ThemeExtension<AppGradinet>? other,
    double t,
  ) {
    if (other == null || other is! AppGradinet) {
      return this;
    }

    return AppGradinet(
      backgroundGradient: LinearGradient.lerp(
        backgroundGradient,
        other.backgroundGradient,
        t,
      )!,
    );
  }
}
