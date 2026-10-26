import '../../ui_kit.dart';

enum ButtonVariant { primaryLG, primarySM, secondary, text }

class UiButton extends ButtonStyleButton {
  final ButtonVariant variant;
  final bool isLoading;

  UiButton.primaryLG({
    required VoidCallback? onPressed,
    this.isLoading = false,
    bool enabled = true,
    IconAlignment iconAlignment = .start,
    Widget? label,
    Widget? icon,
    VoidCallback? onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior,
    super.statesController,
    super.isSemanticButton,
    super.key,
  }) : variant = .primaryLG,
       super(
         child: _ButtonIconAndLabel(
           icon: icon,
           label: label,
           iconAlignment: iconAlignment,
           isLoading: isLoading,
         ),
         onPressed: enabled || isLoading ? onPressed : null,
         onLongPress: enabled || isLoading ? onLongPress : null,
       );

  UiButton.primarySM({
    required VoidCallback? onPressed,
    this.isLoading = false,
    bool enabled = true,
    IconAlignment iconAlignment = .start,
    Widget? label,
    Widget? icon,
    VoidCallback? onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior,
    super.statesController,
    super.isSemanticButton,
    super.key,
  }) : variant = .primarySM,
       super(
         child: _ButtonIconAndLabel(
           icon: icon,
           label: label,
           iconAlignment: iconAlignment,
           isLoading: isLoading,
         ),
         onPressed: enabled || isLoading ? onPressed : null,
         onLongPress: enabled || isLoading ? onLongPress : null,
       );

  UiButton.secondary({
    required VoidCallback? onPressed,
    this.isLoading = false,
    bool enabled = true,
    IconAlignment iconAlignment = .start,
    Widget? label,
    Widget? icon,
    VoidCallback? onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior,
    super.statesController,
    super.isSemanticButton,
    super.key,
  }) : variant = .secondary,
       super(
         child: _ButtonIconAndLabel(
           icon: icon,
           label: label,
           iconAlignment: iconAlignment,
           isLoading: isLoading,
         ),
         onPressed: enabled || isLoading ? onPressed : null,
         onLongPress: enabled || isLoading ? onLongPress : null,
       );

  UiButton.text({
    required VoidCallback? onPressed,
    this.isLoading = false,
    bool enabled = true,
    IconAlignment iconAlignment = .start,
    Widget? label,
    Widget? icon,
    VoidCallback? onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior,
    super.statesController,
    super.isSemanticButton,
    super.key,
  }) : variant = .text,
       super(
         child: _ButtonIconAndLabel(
           icon: icon,
           label: label,
           iconAlignment: iconAlignment,
           isLoading: isLoading,
         ),
         onPressed: enabled ? onPressed : null,
         onLongPress: enabled ? onLongPress : null,
       );

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.appColorPalette;
    final typography = theme.appTypography;

    return switch (variant) {
      .primaryLG => _ButtonPrimaryLGStyle(
        colorPalette: colors,
        typography: typography,
        isLoading: isLoading,
      ),

      .primarySM => _ButtonPrimarySMStyle(
        colorPalette: colors,
        typography: typography,
        isLoading: isLoading,
      ),

      .secondary => _ButtonSecondaryStyle(
        colorPalette: colors,
        typography: typography,
        isLoading: isLoading,
      ),

      .text => _TextButtonStyle(
        colorPalette: colors,
        typography: typography,
        isLoading: isLoading,
      ),
    };
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) => null;
}

class _ButtonIconAndLabel extends StatelessWidget {
  const _ButtonIconAndLabel({
    required this.icon,
    required this.label,
    required this.iconAlignment,
    required this.isLoading,
  });

  final Widget? icon;
  final Widget? label;
  final IconAlignment iconAlignment;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).appColorPalette;

    if (isLoading) {
      return SizedBox.square(
        dimension: 18,
        child: CircularProgressIndicator(strokeWidth: 2, color: palette.ink3),
      );
    }
    return Row(
      mainAxisSize: .min,
      children: iconAlignment == IconAlignment.start
          ? [
              ?icon,
              if (icon != null && label != null) const SizedBox(width: 8),
              if (label != null) Flexible(child: label!),
            ]
          : [
              if (label != null) Flexible(child: label!),
              if (icon != null && label != null) const SizedBox(width: 8),
              ?icon,
            ],
    );
  }
}

class _ButtonPrimaryLGStyle extends _UiBaseButtonStyle {
  const _ButtonPrimaryLGStyle({
    required super.colorPalette,
    required super.typography,
    required this.isLoading,
  });

  final bool isLoading;

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      .resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) return colorPalette.ink3;

        return colorPalette.ink3;
      });

  @override
  WidgetStateProperty<TextStyle?>? get textStyle =>
      WidgetStatePropertyAll(typography.primaryButtonTitle);

  @override
  WidgetStateProperty<Color?>? get backgroundColor => .resolveWith((states) {
    if (states.contains(WidgetState.disabled)) {
      return colorPalette.surface.withValues(alpha: .20);
    }
    return colorPalette.surface;
  });

  @override
  WidgetStateProperty<EdgeInsetsGeometry?>? get padding =>
      const WidgetStatePropertyAll(.symmetric(horizontal: 18, vertical: 12));

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape =>
      const WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: UiBorderRadius.baseBorderRadius),
      );

  @override
  WidgetStateProperty<Color?>? get overlayColor {
    if (isLoading) return const WidgetStatePropertyAll(Colors.transparent);
    return WidgetStatePropertyAll(colorPalette.surface1);
  }
}

class _ButtonPrimarySMStyle extends _UiBaseButtonStyle {
  const _ButtonPrimarySMStyle({
    required super.colorPalette,
    required super.typography,
    required this.isLoading,
  });

  final bool isLoading;

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      .resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) return colorPalette.ink3;

        return colorPalette.ink3;
      });

  @override
  WidgetStateProperty<TextStyle?>? get textStyle =>
      WidgetStatePropertyAll(typography.primaryButtonTitle);

  @override
  WidgetStateProperty<Color?>? get backgroundColor => .resolveWith((states) {
    if (states.contains(WidgetState.disabled)) {
      return colorPalette.surface.withValues(alpha: .20);
    }
    return colorPalette.surface;
  });

  @override
  WidgetStateProperty<EdgeInsetsGeometry?>? get padding =>
      const WidgetStatePropertyAll(.symmetric(horizontal: 64, vertical: 12));

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape =>
      const WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: UiBorderRadius.largeBorderRadius),
      );

  @override
  WidgetStateProperty<Color?>? get overlayColor {
    if (isLoading) return const WidgetStatePropertyAll(Colors.transparent);
    return WidgetStatePropertyAll(colorPalette.surface1);
  }
}

class _ButtonSecondaryStyle extends _UiBaseButtonStyle {
  const _ButtonSecondaryStyle({
    required super.colorPalette,
    required super.typography,
    required this.isLoading,
  });

  final bool isLoading;

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStatePropertyAll(colorPalette.ink);

  @override
  WidgetStateProperty<TextStyle?>? get textStyle =>
      WidgetStatePropertyAll(typography.secondaryButtonTitle);

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStatePropertyAll(colorPalette.surface.withValues(alpha: .12));

  @override
  WidgetStateProperty<EdgeInsetsGeometry?>? get padding =>
      const WidgetStatePropertyAll(.symmetric(vertical: 8, horizontal: 20));

  @override
  WidgetStateProperty<Size?>? get minimumSize =>
      const WidgetStatePropertyAll(Size(100, 31));

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape =>
      const WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: UiBorderRadius.largeBorderRadius),
      );

  @override
  WidgetStateProperty<BorderSide?>? get side => WidgetStatePropertyAll(
    BorderSide(color: colorPalette.surface1, width: 1.5),
  );

  @override
  WidgetStateProperty<Color?>? get overlayColor {
    if (isLoading) return const WidgetStatePropertyAll(Colors.transparent);
    return WidgetStatePropertyAll(colorPalette.surface1.withValues(alpha: .20));
  }
}

class _TextButtonStyle extends _UiBaseButtonStyle {
  const _TextButtonStyle({
    required super.colorPalette,
    required super.typography,
    required this.isLoading,
  });

  final bool isLoading;

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      const WidgetStatePropertyAll(Colors.transparent);

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return colorPalette.ink1;
        }
        return colorPalette.ink;
      });

  @override
  WidgetStateProperty<TextStyle?>? get textStyle =>
      WidgetStatePropertyAll(typography.textButtonTitle);

  @override
  WidgetStateProperty<Color?>? get overlayColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed)) {
          return colorPalette.surface1.withValues(alpha: .16);
        }
        return null;
      });

  @override
  WidgetStateProperty<EdgeInsetsGeometry?>? get padding =>
      const WidgetStatePropertyAll(.symmetric(horizontal: 8, vertical: 4));

  @override
  WidgetStateProperty<Size?>? get minimumSize =>
      const WidgetStatePropertyAll(.zero);

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape =>
      const WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: UiBorderRadius.largeBorderRadius),
      );
}

class _UiBaseButtonStyle extends ButtonStyle {
  const _UiBaseButtonStyle({
    required this.colorPalette,
    required this.typography,
  });

  final ColorPalette colorPalette;
  final AppTypography typography;

  @override
  AlignmentGeometry? get alignment => .center;

  @override
  Duration? get animationDuration => const Duration(milliseconds: 200);

  @override
  MaterialTapTargetSize? get tapTargetSize => .shrinkWrap;

  @override
  WidgetStateProperty<Size?>? get minimumSize =>
      const WidgetStatePropertyAll(Size(100, 52));

  @override
  WidgetStateProperty<Size?>? get maximumSize =>
      const WidgetStatePropertyAll(.infinite);

  @override
  VisualDensity? get visualDensity => .adaptivePlatformDensity;

  @override
  WidgetStateProperty<Color>? get surfaceTintColor =>
      const WidgetStatePropertyAll<Color>(Colors.transparent);

  @override
  WidgetStateProperty<double>? get iconSize =>
      const WidgetStatePropertyAll<double>(18.0);

  @override
  WidgetStateProperty<double>? get elevation =>
      const WidgetStatePropertyAll<double>(0);

  @override
  WidgetStateProperty<Color>? get shadowColor =>
      const WidgetStatePropertyAll<Color>(Colors.transparent);

  @override
  InteractiveInkFeatureFactory? get splashFactory => InkRipple.splashFactory;

  @override
  WidgetStateProperty<MouseCursor?>? get mouseCursor =>
      const WidgetStatePropertyAll(.defer);

  @override
  bool? get enableFeedback => true;
}
