import '../../ui_kit.dart';

class CheckBoxPreview extends StatefulWidget {
  const CheckBoxPreview({super.key});

  @override
  State<CheckBoxPreview> createState() => _CheckBoxPreviewState();
}

class _CheckBoxPreviewState extends State<CheckBoxPreview> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      spacing: 8,
      children: [
        UiCheckBox(
          title: 'Согласен на обработку персональных данных',
          value: isChecked1,
          onChange: (value) {
            setState(() {
              isChecked1 = value;
            });
          },
        ),
        UiCheckBox(
          title: 'Согласен на обработку персональных данных',
          value: isChecked2,
          onChange: (value) {
            setState(() {
              isChecked2 = value;
            });
          },
          isError: !isChecked2,
        ),
        UiCheckBox(
          title: 'Согласен на обработку персональных данных',
          value: isChecked3,
          enabled: false,
          onChange: (value) {
            setState(() {
              isChecked3 = value;
            });
          },
        ),
      ],
    );
  }
}
