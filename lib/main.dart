import 'package:explorer_app/core/modules/translation/translation_service.dart';
import 'package:explorer_app/core/services/shared_prefferences_service.dart';
import 'package:explorer_app/modules/app_module.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();

  await Get.putAsync(() => SharedPreferencesService().init());
  Get.put(() => TranslationService().init());

  runApp(const AppModule());
}
