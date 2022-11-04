import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/widgets/custom_text.dart';
class ButtonContainer extends StatelessWidget {
   ButtonContainer(this.color,this.text, {super.key}) ;
Color color;
String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,

      decoration: BoxDecoration(
          color:color,
          borderRadius: BorderRadius.circular(7.r)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.all(9.r),
              child: CustomText(
                text: text,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFFFFFF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
