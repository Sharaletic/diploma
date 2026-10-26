import '../../ui_kit.dart';

abstract final class UiBorderRadius {
  static const double base = 6.0;
  static const Radius baseRadius = .circular(base);
  static const BorderRadius baseBorderRadius = .all(baseRadius);

  static const double medium = 6.0;
  static const Radius mediumRadius = .circular(medium);
  static const BorderRadius mediumBorderRadius = .all(mediumRadius);

  static const double large = 100;
  static const Radius largeRadius = .circular(large);
  static const BorderRadius largeBorderRadius = .all(largeRadius);
}
