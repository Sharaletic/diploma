import '../../ui_kit.dart';

abstract final class AppFonts {
  static const honor = 'Honor';
  static const factCompressedBold = 'Fact-CompressedBold';
  static const fact = 'Fact';
  static const honorNormal = 'HonorNormal';
  static const package = 'ui_kit';
}

TextStyle honor(double size, FontWeight weight, Color color) => TextStyle(
  fontFamily: AppFonts.honor,
  package: AppFonts.package,
  fontSize: size,
  fontWeight: weight,
  color: color,
);

TextStyle factCompressedBold(double size, FontWeight? weight, Color color) =>
    TextStyle(
      fontFamily: AppFonts.factCompressedBold,
      package: AppFonts.package,
      fontSize: size,
      fontWeight: weight,
      color: color,
    );

TextStyle fact(double size, FontWeight? weight, Color color) => TextStyle(
  fontFamily: AppFonts.fact,
  package: AppFonts.package,
  fontSize: size,
  fontWeight: weight,
  color: color,
);

TextStyle honorNormal(double size, FontWeight weight, Color color) => TextStyle(
  fontFamily: AppFonts.honorNormal,
  package: AppFonts.package,
  fontSize: size,
  fontWeight: weight,
  color: color,
);
