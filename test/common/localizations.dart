import 'package:books/core/core.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';

Future<void> prepareLocalization() async {
  overrideLocalizations(AppLocalizationsEn());
}