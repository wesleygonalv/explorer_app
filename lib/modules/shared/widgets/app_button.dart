import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final IconData? icon;

  const AppButton({super.key, this.onPressed, required this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Column(children: [
        if (icon != null)
          Icon(
            icon,
            size: 20.r,
          ),
        Text(label),
      ]),
    );
  }
}
