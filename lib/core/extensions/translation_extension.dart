import 'package:explorer_app/core/modules/translation/translation_provider.dart';

/// This extension enables the translation of the String in key format into the user's current language
/// Author: @wesleygonalv
/// ### How to use
/// #### Simple use
/// ```dart
/// Text('title'.i18n())
/// ```
/// #### With advanced hierarchy
/// ```dart
/// Text('page1.widget1.buttons.add'.i18n())
/// ```
/// #### With custom params
/// ```dart
/// Text('page1.widget1.label_example'.i18n({'name': 'Wesley ALves'}))
/// ```
extension TranslationExtension on String {
  String i18n([Map<String, Object>? namedParameters]) {
    return TranslationProvider().read(this, namedParameters);
  }
}
