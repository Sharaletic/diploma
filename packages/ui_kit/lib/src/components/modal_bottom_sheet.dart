import '../../ui_kit.dart';

Future<T?> showUiModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
  String? barrierLabel,
  Color? barrierColor,
  bool isScrollControlled = true,
  bool useRootNavigator = true,
  bool useSafeArea = true,
  double? maxHeightFactor,
  RouteSettings? routeSettings,
  AnimationStyle? sheetAnimationStyle,
}) {
  final palette = Theme.of(context).appColorPalette;
  return showModalBottomSheet<T>(
    context: context,
    builder: builder,
    backgroundColor: backgroundColor ?? palette.backgroundBottomSheet,
    shape: const RoundedRectangleBorder(
      borderRadius: .vertical(top: .circular(24)),
    ),
    barrierColor: barrierColor,
    isScrollControlled: isScrollControlled,
    useRootNavigator: useRootNavigator,
    useSafeArea: useSafeArea,
    routeSettings: routeSettings,
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
    this.padding = const .symmetric(horizontal: 24, vertical: 12),
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
