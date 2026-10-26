import '../../ui_kit.dart';

class UiText extends StatelessWidget {
  const UiText(
    this.data,
    this.style, {
    this.color,
    this.height,
    this.textAlign,
    this.overflow,
    this.maxLines,
    super.key,
  });

  final String data;
  final TextStyle style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).appColorPalette;

    return Text(
      data,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: style.copyWith(color: color ?? style.color ?? palette.ink),
    );
  }
}
