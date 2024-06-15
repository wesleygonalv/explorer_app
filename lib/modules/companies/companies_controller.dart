import 'package:explorer_app/modules/companies/models/company_model.dart';
import 'package:explorer_app/modules/companies/companies_provider.dart';
import 'package:get/get.dart';

class CompaniesController extends GetxController
    with StateMixin<List<CompanyModel>> {
  @override
  void onInit() {
    loadInitialData();
    super.onInit();
  }

  void loadInitialData() async {
    RxStatus.loading();
    final provider = Get.put(CompaniesProvider());
    final companies = await provider.getCompanies();
    change(companies, status: RxStatus.success());
  }
}
