import 'package:explorer_app/core/extensions/translation_extension.dart';
import 'package:explorer_app/modules/companies/companies_controller.dart';
import 'package:explorer_app/modules/companies/widgets/company_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CompaniesListView extends GetView<CompaniesController> {
  const CompaniesListView({super.key});

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          'company_list_view.title'.i18n(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40).r,
        child: controller.obx(
          (state) => CustomScrollView(
            center: centerKey,
            slivers: <Widget>[
              SliverGrid(
                key: centerKey,
                delegate: SliverChildListDelegate(
                  state!
                      .map(
                        (company) => CompanyCard(
                          name: company.name,
                          onTap: () {
                            Get.toNamed('/explorer', parameters: {
                              'companyId': company.id,
                              'companyName': company.name,
                            });
                          },
                        ),
                      )
                      .toList(),
                ),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 1.sw,
                  mainAxisSpacing: 50.0.r,
                  childAspectRatio: 4.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
