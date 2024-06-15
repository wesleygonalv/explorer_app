import 'package:explorer_app/core/abstractions/app_connect.dart';
import 'package:explorer_app/modules/companies/models/company_model.dart';

class CompaniesProvider extends AppConnect<CompanyModel> {
  @override
  CompanyModel fromJson(Map<String, dynamic> data) =>
      CompanyModel.fromJson(data);

  /// Get all companies in `Tractian api`
  /// ***
  /// ### parameters:
  /// * **required** String companyId
  /// ### Returns:
  /// * An list of `CompanyModel` object
  Future<List<CompanyModel>> getCompanies() =>
      get('/companies').then((value) => value.body);
}
