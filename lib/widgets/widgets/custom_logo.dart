import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.h),
      child: Image.asset(
        "AppImages.logo_blue",
        height: 70.h,
        width: 100.w,
        fit: BoxFit.contain,
      ),
    );
  }
}
