import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({Key? key, this.image, this.text, this.hint})
      : super(key: key);
  String? image;
  String? text;
  String? hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:15.h,bottom: 15.h),
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(12.r)
        ),


        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(image!),
              CustomText(
                text: text,
                fontSize: 19.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF012970),
              ),
              CustomText(
                text: hint,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: ColorManager.darkGrey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
