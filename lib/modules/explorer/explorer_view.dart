import 'package:explorer_app/core/extensions/translation_extension.dart';
import 'package:explorer_app/modules/explorer/explorer_controller.dart';
import 'package:explorer_app/modules/explorer/widgets/asset_item_widget.dart';
import 'package:explorer_app/modules/explorer/widgets/expanded_explorer_widget.dart';
import 'package:explorer_app/modules/shared/widgets/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExplorerView extends GetView<ExplorerController> {
  const ExplorerView({super.key});

  @override
  Widget build(BuildContext context) {
    final companyName = Get.parameters['companyName'] as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'explorer_view.title'.i18n({'companyName': companyName}),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(child: Obx(() {
                return Column(
                  children: controller.rootLocations
                      .map(
                        (rootLocation) => Padding(
                          padding: const EdgeInsets.only(top: 8.0).r,
                          child: AssetItemWidget(
                            key: Key(rootLocation.id),
                            iconPrepend: const AppIcon.location(),
                            name: rootLocation.name,
                            expandedWidget: ExpandedExplorerWidget(
                              parentObject: rootLocation,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
              })),
            ),
          );
        },
      ),
    );
  }
}
