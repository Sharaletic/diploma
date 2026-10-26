import 'package:ui_kit/ui_kit.dart';

class OtpInputPreview extends StatefulWidget {
  const OtpInputPreview({super.key});

  @override
  State<OtpInputPreview> createState() => _OtpInputPreviewState();
}

class _OtpInputPreviewState extends State<OtpInputPreview> {
  final _controller = TextEditingController();

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UiOtpInput(controller: _controller);
  }
}
