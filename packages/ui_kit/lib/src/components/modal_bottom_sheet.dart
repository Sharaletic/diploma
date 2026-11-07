import '../../ui_kit.dart';
import 'dart:ui';

Future<T?> showUiModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
  String? barrierLabel,
  Color? barrierColor,
  bool isScrollControlled = true,
  bool useRootNavigator = true,
  bool useSafeArea = true,
  RouteSettings? routeSettings,
  AnimationStyle? sheetAnimationStyle,
  double blurSigma = 25,
  double backgroundOpacity = 0.7,
}) {
  final palette = Theme.of(context).appColorPalette;
  final color = backgroundColor ?? palette.backgroundBottomSheet;

  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: Colors.transparent,
    elevation: 0,
    barrierColor: barrierColor,
    isScrollControlled: isScrollControlled,
    useRootNavigator: useRootNavigator,
    useSafeArea: useSafeArea,
    routeSettings: routeSettings,
    sheetAnimationStyle: sheetAnimationStyle,
    builder: (context) => ClipRRect(
      borderRadius: const .vertical(top: .circular(24)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: ColoredBox(
          color: color.withValues(alpha: backgroundOpacity),
          child: builder(context),
        ),
      ),
    ),
  );
}

class UiModalBottomSheetHeader extends StatelessWidget {
  const UiModalBottomSheetHeader({
    super.key,
    required this.title,
    this.description,
  });

  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).appTypography;

    return Column(
      mainAxisSize: .min,
      children: [
        const Strip(),
        const SizedBox(height: 32),
        UiText(title, typography.h3, textAlign: .center),
      ],
    );
  }
}

class Strip extends StatelessWidget {
  const Strip({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).appColorPalette;
    return Center(
      child: SizedBox(
        width: 44,
        height: 3,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: palette.ink1,
            borderRadius: .circular(100),
          ),
        ),
      ),
    );
  }
}

class UiModalBottomSheet extends StatelessWidget {
  const UiModalBottomSheet({
    super.key,
    required this.title,
    required this.content,
    this.padding = const .only(top: 12, left: 24, right: 24, bottom: 34),
  });
  final String title;
  final Widget content;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: padding.add(.only(bottom: bottomInset)),
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .stretch,
            children: [
              UiModalBottomSheetHeader(title: title),
              const SizedBox(height: 16),
              content,
            ],
          ),
        ),
      ),
    );
  }
}
