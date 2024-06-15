import 'package:explorer_app/modules/shared/widgets/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyCard extends StatelessWidget {
  final String name;
  final Color color;
  final GestureTapCallback onTap;

  const CompanyCard({
    super.key,
    required this.name,
    this.color = Colors.blue,
    required this.onTap,
  }) : assert(
          color != Colors.white,
          'Default icon for companies is white and the background cannot be the same color',
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5).r,
        decoration: BoxDecoration(
          color: color,
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black12,
              spreadRadius: 2,
            )
          ],
        ),
        child: SizedBox(
          height: 0.1.sh,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const AppIcon.company(),
              SizedBox(width: 20.r),
              Text(
                name,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
