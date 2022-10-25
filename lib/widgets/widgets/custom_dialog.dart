import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CustomDialog extends StatelessWidget {
  final String? img;
  final bool visibility;
  final String? title;
  final String? desc;
  const CustomDialog(
      {Key? key, this.img, this.visibility = false, this.title = '', this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Container(
            height: 335.h,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(25.r)),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r)),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Image.asset(
                    img!,
                    width: 188.w,
                    height: 197.h,
                  )),
                  SizedBox(
                    height: 15.sp,
                  ),
                  CustomText(
                    text: title,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 15.sp,
                  ),
                  Visibility(
                      visible: visibility,
                      child: CustomText(
                        text: desc,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.normal,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
