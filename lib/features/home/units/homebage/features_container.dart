import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';

import '../../../../core/color_manager/color_manager.dart';

class FeaturesContainer extends StatelessWidget {
  String text;
  FeaturesContainer(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 16.h),
      child: Container(
        height: 53.h,
        width: 1.sw,
        decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(12.r)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage('assets/images/Group 959.png')),
              CustomText(
                text: text,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF000000),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
