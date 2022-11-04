import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/color_manager/color_manager.dart';
import '../../../../widgets/widgets/custom_text.dart';

class body extends StatelessWidget {
  const body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 249.h,
          decoration: const BoxDecoration(
            color: ColorManager.whiteColor,
            image: DecorationImage(
                image: AssetImage('assets/images/Rectangle 18.png')),
          ),
          child: Center(
              child: Padding(
            padding: EdgeInsets.only(left: 15.r, right: 15.r),
            child: Container(
              height: 135.h,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.7),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: Container(
                  height: 115.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFFDC52F))),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: .5.r, right: .5.r),
                          child: CustomText(
                            align: TextAlign.center,
                            text:
                                'Manage your Loads and Vehicles on single place',
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 23.r, right: 23.r),
                          child: CustomText(
                            align: TextAlign.center,
                            text:
                                'Find users available with list of Vehicles or Loads they need to move from one place to another',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                align: TextAlign.start,
                text: 'WHO WE ARE',
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFDC52F),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
          child: CustomText(
            align: TextAlign.start,
            text:
                'We are Logistics integrators with seamless communication between Load uploaders and carrier owners for their smooth transition of loads.',
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF000000),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: CustomText(
            align: TextAlign.start,
            text:
                'We have been regularly updating system towards building a world class solution of Loads, Vehicles, Market and Jobs for an accessible solution towards communication and transparent upload machanism. Every user is given access to platform for their easy communication towards making logistics better.',
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF6C6C6C),
          ),
        ),
        SizedBox(
          height: 22.h,
        ),
      ],
    );
  }
}
