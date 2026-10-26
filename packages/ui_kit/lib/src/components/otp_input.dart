import 'package:ui_kit/ui_kit.dart';
import 'package:flutter/services.dart';

class UiOtpInput extends StatefulWidget {
  const UiOtpInput({
    super.key,
    required this.controller,
    this.length = 6,
    this.isError = false,
    this.isEnabled = true,
  });
  final TextEditingController controller;
  final int length;
  final bool isError;
  final bool isEnabled;

  @override
  State<UiOtpInput> createState() => _UiOtpInputState();
}

class _UiOtpInputState extends State<UiOtpInput> {
  final _focusNode = FocusNode();
  late int _prevLength = widget.controller.text.length;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void didUpdateWidget(covariant UiOtpInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onTextChanged);
      widget.controller.addListener(_onTextChanged);
      _prevLength = widget.controller.text.length;
    }
  }

  void _onTextChanged() {
    final currentLength = widget.controller.text.length;

    final justCompleted =
        currentLength >= widget.length && _prevLength < widget.length;
    _prevLength = currentLength;

    if (justCompleted) {
      _focusNode.unfocus();
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: .merge([_focusNode, widget.controller]),
      builder: (context, _) {
        final isFocused = _focusNode.hasFocus;
        final text = widget.controller.text;

        return Stack(
          children: [
            Opacity(
              opacity: 0,
              child: TextField(
                controller: widget.controller,
                focusNode: _focusNode,
                keyboardType: .number,
                maxLength: widget.length,
                enabled: widget.isEnabled,
                onEditingComplete: () => _focusNode.unfocus(),
                textInputAction: .done,
                decoration: const InputDecoration(counterText: ''),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                autofillHints: const [AutofillHints.oneTimeCode],
              ),
            ),
            GestureDetector(
              behavior: .opaque,
              onTap: () => _focusNode.requestFocus(),
              child: Row(
                spacing: 8,
                children: List.generate(widget.length, (index) {
                  final isCurrent = index == text.length && isFocused;
                  final isFilled = index < text.length;
                  return Expanded(
                    child: InputItem(
                      value: isFilled ? text[index] : '',
                      isCurrent: isCurrent,
                      isFilled: isFilled,
                      isFocused: isFocused,
                      isError: widget.isError,
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}

class InputItem extends StatelessWidget {
  const InputItem({
    super.key,
    required this.value,
    required this.isCurrent,
    required this.isFilled,
    required this.isFocused,
    required this.isError,
  });
  final String value;
  final bool isCurrent;
  final bool isFilled;
  final bool isFocused;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final palette = theme.appColorPalette;
    final typography = theme.appTypography;

    return AnimatedContainer(
      padding: .symmetric(vertical: 18),
      decoration: BoxDecoration(
        border: .all(
          width: 1.7,
          color: switch ((isCurrent, isFilled, isError)) {
            (true, _, false) => palette.surface,
            (false, true, false) => palette.border,
            (false, false, false) => palette.border,
            (_, _, true) => palette.danger,
          },
        ),
        borderRadius: UiBorderRadius.baseBorderRadius,
      ),
      duration: const Duration(milliseconds: 100),
      child: Center(child: UiText(value, typography.h2, color: palette.ink)),
    );
  }
}
