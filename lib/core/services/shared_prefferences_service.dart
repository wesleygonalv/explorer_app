import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService extends GetxService {
  static const String _userLangKey = 'kLang_';

  late SharedPreferences prefs;

  Future<SharedPreferencesService> init() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }

  String? getCurrentUserLang() {
    return prefs.getString(_userLangKey);
  }

  Future<void> setCurrentUserLang(String lang) {
    return prefs.setString(_userLangKey, lang);
  }
}
