import 'package:books/presentation/presentation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

AppLocalizations? _localizations;

AppLocalizations get localizations {
  _localizations ??= AppLocalizations.of(navigatorKey.currentContext!);

  return _localizations!;
}

/// Useful method for tests to override localizations
void overrideLocalizations(AppLocalizations localizations) {
  _localizations = localizations;
}