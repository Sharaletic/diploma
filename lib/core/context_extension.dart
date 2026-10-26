import 'package:ui_kit/ui_kit.dart';

import '../../l10n/app_localizations.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;
  ThemeData get theme => Theme.of(this);
  ColorPalette get palette => theme.appColorPalette;
  AppTypography get typography => theme.appTypography;
}
