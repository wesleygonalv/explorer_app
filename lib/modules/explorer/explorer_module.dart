import 'package:explorer_app/modules/explorer/explorer_controller.dart';
import 'package:explorer_app/modules/explorer/explorer_view.dart';
import 'package:get/get.dart';

class ExplorerModule {
  static final _instance = ExplorerModule._();
  ExplorerModule._();
  factory ExplorerModule() => _instance;

  static GetPage get page => GetPage(
        name: '/explorer',
        page: () {
          Get.put(ExplorerController());

          return const ExplorerView();
        },
        transition: Transition.leftToRightWithFade,
      );
}
