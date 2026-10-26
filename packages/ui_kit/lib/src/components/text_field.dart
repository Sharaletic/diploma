import 'package:flutter/services.dart';
import '../../ui_kit.dart';

enum UiTextInputVariant { outlinedTextField, underlinedTextField }

class UiTextField extends StatefulWidget {
  const UiTextField.outlinedTextField({
    this.controller,
    this.focusNode,
    this.style,
    this.enabled,
    this.inputFormatters,
    this.keyboardType,
    this.autofillHints,
    this.maxLength,
    this.restorationId,
    this.onTap,
    this.readOnly,
    this.onChanged,
    this.onEditingComplete,
    this.textInputAction,
    this.selectionControls,
    this.maxLengthEnforcement,
    this.textCapitalization = .none,
    this.autofocus = false,
    this.expands = false,
    this.obscureText = false,
    this.showCounter = false,
    super.key,
  }) : variant = .outlinedTextField;

  const UiTextField.underlinedTextField({
    this.controller,
    this.focusNode,
    this.style,
    this.enabled,
    this.inputFormatters,
    this.keyboardType,
    this.autofillHints,
    this.maxLength,
    this.restorationId,
    this.onTap,
    this.readOnly,
    this.onChanged,
    this.onEditingComplete,
    this.textInputAction,
    this.selectionControls,
    this.maxLengthEnforcement,
    this.textCapitalization = .none,
    this.autofocus = false,
    this.expands = false,
    this.obscureText = false,
    this.showCounter = false,
    super.key,
  }) : variant = .underlinedTextField;

  final UiTextFieldStyle? style;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final bool expands;
  final bool autofocus;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool showCounter;
  final bool obscureText;
  final String? restorationId;
  final VoidCallback? onTap;
  final bool? readOnly;
  final Function(String)? onChanged;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;
  final TextSelectionControls? selectionControls;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final UiTextInputVariant variant;

  @override
  State<UiTextField> createState() => _UiTextFieldState();
}

class _UiTextFieldState extends State<UiTextField> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final palette = theme.appColorPalette;
    final typography = theme.appTypography;

    final variantStyle = switch (widget.variant) {
      .outlinedTextField => _OutlinedUiTextFieldStyle(
        palette: palette,
        typography: typography,
      ),
      .underlinedTextField => _UnderlinedUiTextFieldStyle(
        palette: palette,
        typography: typography,
      ),
    };

    final style = variantStyle.merge(widget.style);

    return TextField(
      enabled: widget.enabled,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      autofillHints: widget.autofillHints,
      textCapitalization: widget.textCapitalization,
      maxLength: widget.maxLength,
      obscureText: widget.obscureText,
      restorationId: widget.restorationId,
      onTap: widget.onTap,
      readOnly: widget.readOnly ?? false,
      onEditingComplete: widget.onEditingComplete,
      onChanged: widget.onChanged,
      expands: widget.expands,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      controller: widget.controller,
      maxLengthEnforcement: widget.maxLengthEnforcement,
      textInputAction: widget.textInputAction,
      selectionControls: widget.selectionControls,
      cursorColor: style.cursorColor,
      cursorWidth: style.cursorWidth,
      cursorHeight: style.cursorHeight,
      cursorRadius: style.cursorRadius,
      style: style.textStyle,
      decoration: style,
      buildCounter:
          (
            context, {
            required currentLength,
            required isFocused,
            required maxLength,
          }) {
            if (!widget.showCounter || maxLength == null) return null;

            return Text('$currentLength/$maxLength', style: style.counterStyle);
          },
    );
  }
}

class _OutlinedUiTextFieldStyle extends UiTextFieldStyle {
  _OutlinedUiTextFieldStyle({required this.palette, required this.typography})
    : super(
        cursorColor: palette.accent,
        cursorWidth: 2,
        cursorHeight: 22,
        cursorRadius: .circular(0),
      );

  final ColorPalette palette;
  final AppTypography typography;

  @override
  TextStyle? get textStyle => typography.textField;

  @override
  TextStyle? get errorStyle => typography.caption1;

  @override
  int? get errorMaxLines => 2;

  @override
  TextStyle? get hintStyle => typography.hintField;

  @override
  InputBorder? get focusedBorder => OutlineInputBorder(
    borderRadius: UiBorderRadius.baseBorderRadius,
    borderSide: BorderSide(color: palette.surface),
  );

  @override
  InputBorder? get focusedErrorBorder => OutlineInputBorder(
    borderRadius: UiBorderRadius.baseBorderRadius,
    borderSide: BorderSide(color: palette.danger, width: 1.7),
  );

  @override
  InputBorder? get errorBorder => OutlineInputBorder(
    borderRadius: UiBorderRadius.baseBorderRadius,
    borderSide: BorderSide(color: palette.danger, width: 1.7),
  );

  @override
  InputBorder? get enabledBorder => OutlineInputBorder(
    borderRadius: UiBorderRadius.baseBorderRadius,
    borderSide: BorderSide(color: palette.border, width: 1.7),
  );

  @override
  InputBorder? get disabledBorder => OutlineInputBorder(
    borderRadius: UiBorderRadius.baseBorderRadius,
    borderSide: BorderSide(color: palette.border, width: 1.7),
  );

  @override
  EdgeInsetsGeometry? get contentPadding =>
      .symmetric(vertical: 18, horizontal: 20);

  @override
  BoxConstraints? get constraints => BoxConstraints(minHeight: 52);

  @override
  bool? get isDense => true;
}

class _UnderlinedUiTextFieldStyle extends UiTextFieldStyle {
  _UnderlinedUiTextFieldStyle({required this.palette, required this.typography})
    : super(
        cursorColor: palette.accent,
        cursorWidth: 2,
        cursorHeight: 22,
        cursorRadius: .circular(0),
      );

  final ColorPalette palette;
  final AppTypography typography;

  @override
  TextStyle? get textStyle => typography.textField;

  @override
  TextStyle? get errorStyle => typography.caption1;

  @override
  int? get errorMaxLines => 2;

  @override
  TextStyle? get hintStyle => typography.hintField;

  @override
  InputBorder? get focusedBorder => UnderlineInputBorder(
    borderSide: BorderSide(color: palette.accent, width: 1.7),
  );

  @override
  InputBorder? get focusedErrorBorder => UnderlineInputBorder(
    borderSide: BorderSide(color: palette.danger, width: 1.7),
  );

  @override
  InputBorder? get errorBorder => UnderlineInputBorder(
    borderSide: BorderSide(color: palette.danger, width: 1.7),
  );

  @override
  InputBorder? get enabledBorder => UnderlineInputBorder(
    borderSide: BorderSide(color: palette.border, width: 1.7),
  );

  @override
  InputBorder? get disabledBorder => UnderlineInputBorder(
    borderSide: BorderSide(color: palette.border, width: 1.7),
  );

  @override
  EdgeInsetsGeometry? get contentPadding =>
      .symmetric(vertical: 12, horizontal: 0);

  @override
  BoxConstraints? get constraints => BoxConstraints(minHeight: 52);

  @override
  bool? get isDense => true;
}

class UiTextFieldStyle extends InputDecoration {
  const UiTextFieldStyle({
    super.icon,
    super.iconColor,
    super.label,
    super.labelText,
    super.labelStyle,
    super.floatingLabelStyle,
    super.helper,
    super.helperText,
    super.helperStyle,
    super.helperMaxLines,
    super.hintText,
    super.hintStyle,
    super.hintTextDirection,
    super.hintMaxLines,
    super.hintFadeDuration,
    super.error,
    super.errorText,
    super.errorStyle,
    super.errorMaxLines,
    super.floatingLabelBehavior,
    super.floatingLabelAlignment,
    super.isCollapsed,
    super.isDense,
    super.contentPadding,
    super.prefixIcon,
    super.prefixIconConstraints,
    super.prefix,
    super.prefixText,
    super.prefixStyle,
    super.prefixIconColor,
    super.suffixIcon,
    super.suffix,
    super.suffixText,
    super.suffixStyle,
    super.suffixIconColor,
    super.suffixIconConstraints,
    super.counter,
    super.counterText,
    super.counterStyle,
    super.filled,
    super.fillColor,
    super.focusColor,
    super.hoverColor,
    super.errorBorder,
    super.focusedBorder,
    super.focusedErrorBorder,
    super.disabledBorder,
    super.enabledBorder,
    super.border,
    super.enabled = true,
    super.semanticCounterText,
    super.alignLabelWithHint,
    super.constraints,
    this.textStyle,
    this.cursorColor,
    this.cursorWidth = 2,
    this.cursorHeight,
    this.cursorRadius,
  });

  final TextStyle? textStyle;
  final Color? cursorColor;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;

  UiTextFieldStyle merge(UiTextFieldStyle? other) {
    if (other == null) return this;
    return UiTextFieldStyle(
      icon: other.icon ?? icon,
      iconColor: other.iconColor ?? iconColor,
      label: other.label ?? label,
      labelText: other.labelText ?? labelText,
      labelStyle: other.labelStyle ?? labelStyle,
      floatingLabelStyle: other.floatingLabelStyle ?? floatingLabelStyle,
      helper: other.helper ?? helper,
      helperText: other.helperText ?? helperText,
      helperStyle: other.helperStyle ?? helperStyle,
      helperMaxLines: other.helperMaxLines ?? helperMaxLines,
      hintText: other.hintText ?? hintText,
      hintStyle: other.hintStyle ?? hintStyle,
      hintTextDirection: other.hintTextDirection ?? hintTextDirection,
      hintMaxLines: other.hintMaxLines ?? hintMaxLines,
      hintFadeDuration: other.hintFadeDuration ?? hintFadeDuration,
      error: other.error ?? error,
      errorText: other.errorText ?? errorText,
      errorStyle: other.errorStyle ?? errorStyle,
      errorMaxLines: other.errorMaxLines ?? errorMaxLines,
      floatingLabelBehavior:
          other.floatingLabelBehavior ?? floatingLabelBehavior,
      floatingLabelAlignment:
          other.floatingLabelAlignment ?? floatingLabelAlignment,
      isCollapsed: other.isCollapsed ?? isCollapsed,
      isDense: other.isDense ?? isDense,
      contentPadding: other.contentPadding ?? contentPadding,
      prefixIcon: other.prefixIcon ?? prefixIcon,
      prefixIconConstraints:
          other.prefixIconConstraints ?? prefixIconConstraints,
      prefix: other.prefix ?? prefix,
      prefixText: other.prefixText ?? prefixText,
      prefixStyle: other.prefixStyle ?? prefixStyle,
      prefixIconColor: other.prefixIconColor ?? prefixIconColor,
      suffixIcon: other.suffixIcon ?? suffixIcon,
      suffix: other.suffix ?? suffix,
      suffixText: other.suffixText ?? suffixText,
      suffixStyle: other.suffixStyle ?? suffixStyle,
      suffixIconColor: other.suffixIconColor ?? suffixIconColor,
      suffixIconConstraints:
          other.suffixIconConstraints ?? suffixIconConstraints,
      counter: other.counter ?? counter,
      counterText: other.counterText ?? counterText,
      counterStyle: other.counterStyle ?? counterStyle,
      filled: other.filled ?? filled,
      fillColor: other.fillColor ?? fillColor,
      focusColor: other.focusColor ?? focusColor,
      hoverColor: other.hoverColor ?? hoverColor,
      errorBorder: other.errorBorder ?? errorBorder,
      focusedBorder: other.focusedBorder ?? focusedBorder,
      focusedErrorBorder: other.focusedErrorBorder ?? focusedErrorBorder,
      disabledBorder: other.disabledBorder ?? disabledBorder,
      enabledBorder: other.enabledBorder ?? enabledBorder,
      border: other.border ?? border,
      enabled: other.enabled,
      semanticCounterText: other.semanticCounterText ?? semanticCounterText,
      alignLabelWithHint: other.alignLabelWithHint ?? alignLabelWithHint,
      constraints: other.constraints ?? constraints,
      textStyle: other.textStyle ?? textStyle,
      cursorColor: other.cursorColor ?? cursorColor,
      cursorWidth: other.cursorWidth,
      cursorHeight: other.cursorHeight ?? cursorHeight,
      cursorRadius: other.cursorRadius ?? cursorRadius,
    );
  }
}
