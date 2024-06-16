import 'package:explorer_app/core/extensions/translation_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExplorerView extends StatelessWidget {
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
      body: Container(
        child: Text('ok'),
      ),
    );
  }
}
