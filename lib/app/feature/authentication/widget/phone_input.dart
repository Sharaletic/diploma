import 'package:diploma/core/context_extension.dart';
import 'package:ui_kit/ui_kit.dart';

import '../authentication.dart';

class PhoneInput extends StatelessWidget {
  const PhoneInput({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;

    return UiTextField.underlinedTextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: .phone,
      inputFormatters: const [PhoneInputFormatter()],
      autofillHints: const [AutofillHints.telephoneNumber],
      style: UiTextFieldStyle(
        hintText: '(123) 456-789-10',
        prefixIconConstraints: const BoxConstraints(maxWidth: 50),
        prefixIcon: Align(
          alignment: .centerLeft,
          widthFactor: 1,
          heightFactor: 1,
          child: UiText('+7', typography.textField),
        ),
      ),
    );
  }
}
