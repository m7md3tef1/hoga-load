import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';

import '../../../../core/color_manager/color_manager.dart';

class BuyContainer extends StatelessWidget {
  BuyContainer(this.text, this.desc, this.number,this.image, {super.key});
  String text;
  String desc;
  String number;
  var image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 36.h),
      child: Container(
        height: 550.h,
        decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(12.r)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 18.h, bottom: 15.h),
              child: CustomText(
                text: text,
                fontSize: 18.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            Stack(children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: CustomText(
                        text: '\$',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF000000),
                      ),
                    ),
                    CustomText(
                      text: number,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF000000),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: CustomText(
                        text: '/ mo',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFFA9A9A9),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
             Image(image: AssetImage(image)),
            Expanded(
              child: CustomText(
                text: desc,
                fontSize: 18.sp,
                align: TextAlign.center,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF000000),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.r),
              child: Container(
                height: 60.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF0D6EFD),
                  ),
                  color: ColorManager.whiteColor,
                  borderRadius: BorderRadius.circular(7.r),
                ),
                child: Center(
                  child: CustomText(
                    text: 'Buy Now',
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0D6EFD),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
