import 'package:explorer_app/modules/explorer/explorer_provider.dart';
import 'package:explorer_app/modules/explorer/models/tree_object_model.dart';
import 'package:get/get.dart';

class ExplorerController extends GetxController {
  // Raw data
  RxList<TreeObjectModel> locations = <TreeObjectModel>[].obs;
  RxList<TreeObjectModel> assets = <TreeObjectModel>[].obs;
  // Raw location
  RxList<TreeObjectModel> rootLocations = <TreeObjectModel>[].obs;
  RxList<TreeObjectModel> objects = <TreeObjectModel>[].obs;

  @override
  void onInit() async {
    await loadInitialData();
    super.onInit();
  }

  Future<void> loadInitialData() async {
    RxStatus.loading();
    final provider = Get.put(ExplorerProvider());
    final companyId = Get.parameters['companyId'];
    assert(companyId != null,
        'Company id is required to load initial company data, please review routes');
    final locations = await provider.getLocationsBy(companyId: companyId!);
    final assets = await provider.getAssetsBy(companyId: companyId);
    rootLocations.addAll(locations.where((obj) => obj.isRoot));
    this.locations.addAll(locations);
    this.assets.addAll(assets);
    objects.addAll(locations);
    objects.addAll(assets);
  }
}
