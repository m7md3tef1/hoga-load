import 'package:flutter/material.dart';
import 'package:hoga_load/core/app_images/app_images.dart';
class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.logo,height: 150,width: 150,)
    ;
  }
}
