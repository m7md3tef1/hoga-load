import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_card_title.dart';
import '../../../widgets/widgets/custom_button.dart';
import '../../../widgets/widgets/custom_text.dart';
class Plans extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          SizedBox(height: 18.h,),
          CustomCardTitle(text: 'SATINDER SINGH - SILVER PLAN',),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomText(
                    text: 'Started',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF777777),
                  ),
                  CustomText(
                    text: 'July 10,2022',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF777777),
                  ),
                ],
              ),
              SizedBox(
                  height: 50.h,
                  child: const Divider(
                    thickness: 1,
                    color: Colors.black,
                  )),
              Column(
                children: [
                  CustomText(
                    text: 'Next Invoice',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF777777),
                  ),
                  CustomText(
                    text: 'August 11, 2022',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF777777),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
          Container(
            width: 1.sw,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(253, 197, 47, 0.3),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 13.h,
                ),
                Container(
                  child: Center(
                    child: CustomText(
                      align: TextAlign.center,
                      text: 'Upgrage to "Gold Plan" and\n enjoy more facilities.',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF664D03),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 16.w),
                  child: CustomButton(
                      text: 'Upgrade to "Gold Plan"',
                      color: const Color(0xFFFDC52F)),
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),        ],
      );
  }
}
