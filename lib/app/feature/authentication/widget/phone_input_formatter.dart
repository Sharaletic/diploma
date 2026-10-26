import 'package:flutter/services.dart';

class PhoneInputFormatter extends TextInputFormatter {
  const PhoneInputFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var digits = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (digits.length == 11 &&
        (digits.startsWith('7') || digits.startsWith('8'))) {
      digits = digits.substring(1);
    }

    if (digits.isEmpty) return const TextEditingValue();
    if (!digits.startsWith('9')) return oldValue;

    final limited = digits.substring(0, digits.length.clamp(0, 10));

    final buffer = StringBuffer('(9');

    if (limited.length > 1) {
      buffer.write(limited.substring(1, limited.length.clamp(1, 3)));
    }

    if (limited.length > 3) {
      buffer.write(') ');
      buffer.write(limited.substring(3, limited.length.clamp(3, 6)));
    }

    if (limited.length > 6) {
      buffer.write('-');
      buffer.write(limited.substring(6, limited.length.clamp(6, 8)));
    }

    if (limited.length > 8) {
      buffer.write('-');
      buffer.write(limited.substring(8, limited.length.clamp(8, 10)));
    }

    final text = buffer.toString();

    final cursorDigitIndex = _countDigitsBeforeCursor(
      newValue.text,
      newValue.selection.baseOffset,
    );

    final cursorOffset = _findCursorOffset(text, cursorDigitIndex);

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: cursorOffset),
    );
  }

  int _countDigitsBeforeCursor(String text, int cursorOffset) {
    final safeOffset = cursorOffset.clamp(0, text.length);

    return RegExp(r'\d').allMatches(text.substring(0, safeOffset)).length;
  }

  int _findCursorOffset(String text, int digitIndex) {
    if (digitIndex <= 0) return 0;

    var digitsSeen = 0;

    for (var i = 0; i < text.length; i++) {
      if (RegExp(r'\d').hasMatch(text[i])) {
        digitsSeen++;

        if (digitsSeen == digitIndex) {
          return i + 1;
        }
      }
    }

    return text.length;
  }
}
