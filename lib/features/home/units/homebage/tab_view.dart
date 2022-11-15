import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/color_manager/color_manager.dart';
import '../../../../widgets/widgets/custom_text.dart';

// ignore: must_be_immutable
class TabView extends StatelessWidget {
  TabView(this.hint1, this.text1, this.hint2, this.text2, this.hint3,
      {super.key});
  String hint1;
  String text1;
  String hint2;
  String text2;
  String hint3;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: CustomText(
            text: hint1,
            color: const Color(0xFF535353),
            align: TextAlign.start,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 9.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Row(
            children: [
              const Image(image: AssetImage('assets/images/Vector.png')),
              CustomText(
                text: text1,
                color: ColorManager.primaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 9.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: CustomText(
            text: hint2,
            color: const Color(0xFF535353),
            align: TextAlign.start,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 9.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Row(
            children: [
              const Image(image: AssetImage('assets/images/Vector.png')),
              text2.length>30?
              Expanded(
                child: CustomText(
                  text: text2,
                  color: ColorManager.primaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ):CustomText(
                text: text2,
                color: ColorManager.primaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 9.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: CustomText(
            text: hint3,
            color: const Color(0xFF535353),
            align: TextAlign.start,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
      ],
    );
  }
}
