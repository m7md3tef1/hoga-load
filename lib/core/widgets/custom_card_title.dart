import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/widgets/custom_text.dart';
class CustomCardTitle extends StatelessWidget {
  String? text;

  CustomCardTitle({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
          fontSize: 18.sp,
          align: TextAlign.center,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 14.h,),
        const Divider(
          thickness: 1,
        ),
        SizedBox(height: 8.h,),

      ],
    );
  }
}
