import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_card_title.dart';
import '../../../widgets/widgets/custom_text.dart';
class Facilities extends StatelessWidget {
  const Facilities({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCardTitle(text: 'FACILITIES',),
        SizedBox(height: 30.h,),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: name2.length,
            itemBuilder: (context, index) => Padding(
              padding:
              EdgeInsets.only(bottom: 17.h, left: 9.w, right: 9.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: name2[index],
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF777777),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CustomText(
                        text: detail2[index],
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF777777),
                      )

                    ],
                  ),
                ],
              ),
            )),      ],
    );
  }
}
List name2 = [
  'Loads to Upload',
  'Vehicles to Upload',
  'Products to Upload',
  'Jobs to Upload',
  'Loads Remains',
  'Vehicles Remains',
  'Products Remains',
  'Jobs Remains'
];
List detail2 = [
  '300',
  '300',
  '30',
  '20',
  '300',
  '300',
  '30',
  '20',
];