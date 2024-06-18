import 'package:explorer_app/core/abstractions/app_connect.dart';
import 'package:explorer_app/modules/explorer/models/tree_object_model.dart';

class ExplorerProvider extends AppConnect<TreeObjectModel> {
  @override
  TreeObjectModel fromJson(Map<String, dynamic> data) =>
      TreeObjectModel.fromJson(data);

  /// Get all objects in the assets tree by company id
  /// ***
  /// ### parameters:
  /// * **required** String companyId
  /// ### Returns:
  /// * TreeObjectModel instance
  Future<List<TreeObjectModel>> getAssetsBy({required String companyId}) =>
      get('/companies/$companyId/assets').then((value) => value.body);

  /// Get all objects in the location tree by company id
  /// ***
  /// ### parameters:
  /// * **required** String companyId
  /// ### Returns:
  /// * TreeObjectModel instance
  Future<List<TreeObjectModel>> getLocationsBy({required String companyId}) =>
      get('/companies/$companyId/locations').then((value) => value.body);
}
