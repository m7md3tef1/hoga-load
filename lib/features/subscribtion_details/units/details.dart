import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/color_manager/color_manager.dart';
import '../../../core/widgets/custom_card_title.dart';
import '../../../widgets/widgets/custom_text.dart';
class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15.h,
        ),
        CustomCardTitle(text:'SUBSCRIPTION DETAILS' ,),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: name.length,
            itemBuilder: (context, index) => Padding(
              padding:
              EdgeInsets.only(bottom: 17.h, left: 9.w, right: 9.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: name[index],
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF777777),
                      )
                    ],
                  ),
                  Spacer(),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        index != 6
                            ? CustomText(
                          align: TextAlign.end,
                          text: detail[index],
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF777777),
                        )
                            : Row(
                          children: [
                            Container(
                              height: 20.h,
                              width: 58.w,
                              decoration: BoxDecoration(
                                  color: ColorManager.primaryColor,
                                  borderRadius:
                                  BorderRadius.circular(5.r)),
                              child: Center(
                                child: CustomText(
                                  text: 'Active',
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.whiteColor,
                                ),
                              ),
                            ),
                            CustomText(
                              text: '  Cancel?',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFFDC52F),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),      ],
    );
  }
}
List name = [
  'Customer',
  'Created',
  'Current Period',
  'ID',
  'Billing Method',
  'Payment Method',
  'Status',
];
List detail = [
  'Satinder Singh',
  '2022-07-10',
  'July 10, 2022 to August 10, 2022',
  'sub_1LK5jyDRXkgoS6oY2sGQn9xS',
  'Card Payment',
  'xxxx-xxxx-xxxx-4242',
  '',
];
