import 'package:explorer_app/modules/companies/companies_controller.dart';
import 'package:explorer_app/modules/companies/companies_list_view.dart';
import 'package:get/get.dart';

class CompaniesModule {
  static final _instance = CompaniesModule._();
  CompaniesModule._();
  factory CompaniesModule() => _instance;

  static GetPage get page => GetPage(
      name: '/',
      page: () {
        // Init controllers and providers before view
        Get.lazyPut(() => CompaniesController());

        return const CompaniesListView();
      });
}
