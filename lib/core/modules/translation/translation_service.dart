import 'package:explorer_app/core/services/shared_prefferences_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

/// Custom translation service
/// ### How to use\
/// #### With getx
/// ```dart
/// Get.putAsync(TranslationService().init());
///
/// // Get current locale
/// TranslationService service = Get.find();
/// Locale locale = service.currentLocale;
/// // Update user locale
/// service.updateUserLocale(Locale('pt-br'))
/// ```
class TranslationService extends GetxService {
  static const _defaultLanguage = 'pt_BR';
  Rx<String> _currentLocale = 'en'.obs;
  Locale get currentLocale =>
      Locale.fromSubtags(languageCode: _currentLocale.value);

  TranslationService init() {
    // Load current user language
    SharedPreferencesService shrPrefs = Get.find();
    String? lang = shrPrefs.getCurrentUserLang();

    lang ??= Get.deviceLocale?.languageCode ?? _defaultLanguage;
    _currentLocale = lang.obs;
    return this;
  }

  Future<void> updateUserLocale(Locale locale) async {
    _currentLocale = locale.languageCode.obs;
    // Apply selected locale in shared prefferences
    await SharedPreferencesService().setCurrentUserLang(locale.languageCode);
  }
}
