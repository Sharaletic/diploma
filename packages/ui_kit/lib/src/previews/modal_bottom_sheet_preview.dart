import 'package:ui_kit/ui_kit.dart';

class ModalBottomSheetPreview extends StatelessWidget {
  const ModalBottomSheetPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return UiButton.primaryLG(
      label: const Text('Show Modal Bottom Sheet'),
      onPressed: () => showUiModalBottomSheet(
        context: context,

        builder: (_) => UiModalBottomSheet(
          title: 'Title Of Bottom Sheet',
          content: Column(
            children: [
              UiText(
                'Content of Modal Bottom Sheet',
                Theme.of(context).appTypography.subtitle,
              ),
              const UiTextField.underlinedTextField(
                style: UiTextFieldStyle(hintText: 'Text input'),
              ),
              const SizedBox(height: 400),
            ],
          ),
        ),
      ),
    );
  }
}
