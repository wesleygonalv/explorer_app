import 'package:explorer_app/modules/explorer/explorer_controller.dart';
import 'package:explorer_app/modules/explorer/models/tree_object_model.dart';
import 'package:explorer_app/modules/explorer/widgets/asset_item_widget.dart';
import 'package:explorer_app/modules/shared/widgets/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpandedExplorerWidget extends StatelessWidget {
  final TreeObjectModel parentObject;

  ExpandedExplorerWidget({required this.parentObject})
      : super(key: Key(parentObject.id));

  getIcons(ExplorerController controller, TreeObjectModel child) {
    if (child.sensorType == 'energy') {
      return [const AppIcon.component(), Icons.electric_bolt, Colors.green];
    } else if (child.sensorType == 'vibration') {
      return [const AppIcon.component(), Icons.priority_high, Colors.red];
    } else if (controller.locations
            .firstWhereOrNull((location) => location.id == child.id) !=
        null) {
      return [
        const AppIcon.location(),
        null,
        null,
      ];
    } else {
      return [
        const AppIcon.asset(),
        null,
        null,
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    // Filter by sub-assets, sub-locations or components
    isPartOf(parent) =>
        (child) => parent.id == child.parentId || parent.id == child.locationId;

    final controller = Get.put(ExplorerController());
    final childs = controller.objects.where(isPartOf(parentObject));
    return Column(
      children: childs.map((child) {
        final [iconPrepend, iconAppend, iconAppendColor] =
            getIcons(controller, child);
        return AssetItemWidget(
          key: Key(child.id),
          iconPrepend: iconPrepend,
          name: child.name,
          iconAppend: iconAppend,
          iconAppendColor: iconAppendColor,
          expandedWidget:
              controller.objects.firstWhereOrNull(isPartOf(child)) == null
                  ? null
                  : ExpandedExplorerWidget(parentObject: child),
        );
      }).toList(),
    );
  }
}
