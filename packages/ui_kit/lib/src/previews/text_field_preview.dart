import '../../ui_kit.dart';

class TextFieldsPreview extends StatelessWidget {
  const TextFieldsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typography = theme.appTypography;

    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .stretch,
      children: [
        UiText('Outlined Text Field', typography.h3),
        const SizedBox(height: 16),
        UiTextField.outlinedTextField(
          style: UiTextFieldStyle(hintText: 'Введите значение'),
        ),
        const SizedBox(height: 16),
        UiTextField.outlinedTextField(
          style: UiTextFieldStyle(
            hintText: 'Введите значение',
            errorText: 'Ошибка',
          ),
        ),
        const SizedBox(height: 16),
        UiTextField.outlinedTextField(
          showCounter: true,
          enabled: false,
          style: UiTextFieldStyle(hintText: 'Введите значение'),
        ),
        const SizedBox(height: 20),
        UiText('Underlined Text Field', typography.h3),
        const SizedBox(height: 16),
        UiTextField.underlinedTextField(
          style: UiTextFieldStyle(hintText: 'Введите значение'),
        ),
        const SizedBox(height: 16),
        UiTextField.underlinedTextField(
          style: UiTextFieldStyle(
            hintText: 'Введите значение',
            errorText: 'Ошибка',
          ),
        ),
        const SizedBox(height: 16),
        UiTextField.underlinedTextField(
          showCounter: true,
          enabled: false,
          style: UiTextFieldStyle(hintText: 'Введите значение'),
        ),
      ],
    );
  }
}
