import 'package:explorer_app/core/modules/translation/translation_provider.dart';
import 'package:explorer_app/core/modules/translation/translation_service.dart';
import 'package:explorer_app/modules/companies/companies_module.dart';
import 'package:explorer_app/modules/explorer/explorer_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    // Custom translation
    TranslationService translation = Get.put(TranslationService());

    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          locale: translation.currentLocale,
          localizationsDelegates: [
            TranslationProvider(),
          ],
          theme: ThemeData(
            fontFamily: 'roboto',
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.blue,
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              centerTitle: true,
              titleTextStyle: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
              ),
            ),
          ),
          getPages: [
            CompaniesModule.page,
            ExplorerModule.page,
          ],
        );
      },
    );
  }
}
