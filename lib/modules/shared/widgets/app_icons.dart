import 'package:flutter/material.dart';

class AppIcon extends Image {
  const AppIcon.asset({
    super.key,
  }) : super(
          image: const AssetImage('assets/icons/asset.png'),
          width: 20,
          height: 20,
        );
  const AppIcon.component({
    super.key,
  }) : super(
          image: const AssetImage('assets/icons/component.png'),
          width: 20,
          height: 20,
        );
  const AppIcon.location({
    super.key,
  }) : super(
          image: const AssetImage('assets/icons/location.png'),
          width: 20,
          height: 20,
        );
  const AppIcon.company({
    super.key,
  }) : super(
          image: const AssetImage('assets/icons/company.png'),
          width: 20,
          height: 20,
        );
}
