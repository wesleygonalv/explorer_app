import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/message_format.dart';
import 'package:jiffy/jiffy.dart';
import 'package:logger/logger.dart';

/// Personalized service for reading translation files
/// Author: @wesleygonalv
/// #### How to use
/// ```
/// Widget build(BuildContext context) {
///  // Load controller
///  TranslationController translation = Get.put(TranslationController());
///
///  return GetMaterialApp(
///    //...
///    // Apply current lang by shared preference fetch
///    locale: translation.currentLocale,
///    // Apply this custom translation delegate
///    localizationsDelegates: [
///      TranslationProvider(),
///    ],
///    //...
///  );
/// }
/// ```
class TranslationProvider extends LocalizationsDelegate {
  static final TranslationProvider _instance = TranslationProvider._();
  TranslationProvider._();
  factory TranslationProvider() => _instance;

  Map<String, dynamic>? _sentences = <String, dynamic>{};
  late Locale currentLocale;

  /// Method responsible for load i18n file according the selectedLocale;
  Future<void> changeLanguage(Locale locale) async {
    currentLocale = locale;
    await Jiffy.setLocale(locale.languageCode);
    final selectedLanguage = locale.toString();
    final jsonFile = 'lang/$selectedLanguage.json';
    try {
      String data = await rootBundle.loadString(jsonFile);
      _sentences = json.decode(data);
    } catch (error, stackTrace) {
      Logger().e(
        'An error occurred while importing the translation file $jsonFile',
        time: DateTime.now(),
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  /// Method responsible for performing the conversion from key to text
  String read(String key, [Map<String, Object>? namedParameters]) {
    var value = _getValue(key);
    if (namedParameters != null && namedParameters.isNotEmpty) {
      return MessageFormat(value).format(namedParameters);
    } else {
      return value;
    }
  }

  String _getValue(String key) {
    List<String> keys = key.split('.');
    var value = keys.fold(_sentences, (dynamic value, key) {
      if (value is Map) {
        // Must be return a key for flutter render a new value in stateless widgets
        return value[key] ?? key;
      }
      return value.toString();
    });
    return value;
  }

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<dynamic> load(Locale locale) {
    return TranslationProvider().changeLanguage(locale);
  }

  @override
  bool shouldReload(TranslationProvider old) => true;
}
