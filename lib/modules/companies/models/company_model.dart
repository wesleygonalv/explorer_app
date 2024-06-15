import 'package:explorer_app/core/extensions/map_extension.dart';

class CompanyModel {
  final String id;
  final String name;

  CompanyModel({
    required this.id,
    required this.name,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> data) {
    return CompanyModel(
      id: data.getString('id')!,
      name: data.getString('name')!,
    );
  }
}
