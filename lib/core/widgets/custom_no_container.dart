import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/widgets/custom_text.dart';
class CustomNoContainer extends StatelessWidget {
  String? text;

  CustomNoContainer({ required this.text});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height:135.h ,
      width: 1.sw,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(253, 197, 47, 0.3),
          borderRadius: BorderRadius.circular(10.r)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomText(
            align: TextAlign.center,
            text: 'There is no $text uploaded by you.',
            fontSize: 16.sp,
            textHeight: 1.5,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF664D03),
          ),
        ),
      ),
    );
  }
}
