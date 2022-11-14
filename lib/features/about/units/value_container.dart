import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/color_manager/color_manager.dart';
import '../../../widgets/widgets/custom_text.dart';
class ValueContainer extends StatelessWidget {
  String? image;
  String? title;
  String? desc;

  ValueContainer({this.image, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1.sw,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: ColorManager.whiteColor),
          child: Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child: Column(
              children: [
                Container(
                  height: 170.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      image:  DecorationImage(
                          image: AssetImage(image!),
                          fit: BoxFit.cover)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 11.h),
                          child: CustomText(
                            text: title,
                            fontSize: 16.sp,
                            color: const Color(0xFF012970),
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 10.h, bottom: 14.h, left: 15.w, right: 15.w),
                  child: CustomText(
                    align: TextAlign.center,
                    color: const Color(0xFF6C6C6C),
                    text:desc!,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 22.h,
        ),
      ],
    );
  }
}
