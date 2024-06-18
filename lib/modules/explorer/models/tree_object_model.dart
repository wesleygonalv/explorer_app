import 'package:explorer_app/core/extensions/map_extension.dart';

class TreeObjectModel {
  final String id;
  final String name;
  final String? locationId;
  final String? gatewayId;
  final String? parentId;
  final String? sensorId;
  final String? sensorType;
  final String? status;

  TreeObjectModel({
    required this.id,
    required this.name,
    required this.locationId,
    required this.gatewayId,
    required this.parentId,
    required this.sensorId,
    required this.sensorType,
    required this.status,
  });

  factory TreeObjectModel.fromJson(Map<String, dynamic> data) {
    return TreeObjectModel(
      id: data.getString('id')!,
      name: data.getString('name')!,
      locationId: data.getString('locationId'),
      gatewayId: data.getString('gatewayId'),
      parentId: data.getString('parentId'),
      sensorId: data.getString('sensorId'),
      sensorType: data.getString('sensorType'),
      status: data.getString('status'),
    );
  }

  bool get isRoot {
    return parentId == null;
  }
}
