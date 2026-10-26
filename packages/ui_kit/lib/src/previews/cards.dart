import '../../ui_kit.dart';

class CardsPreview extends StatelessWidget {
  const CardsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typography = theme.appTypography;

    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .stretch,
      children: [
        UiText('Error Card', typography.h3),
        const SizedBox(height: 16),
        UiErrorCard(
          message:
              'Слишком много попыток. Заказать новый звонок можно через 10:00',
        ),
      ],
    );
  }
}
