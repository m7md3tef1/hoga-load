import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  Widget? widget;
  double? bottomPadding;
  double? paddingInStart;
  double? paddingInEnd;

  CustomCard(
      {super.key,
      this.widget,
      this.bottomPadding,
      this.paddingInEnd,
      this.paddingInStart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: 15, left: 15, top: 22, bottom: bottomPadding ?? 25),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: paddingInStart ?? 12.sp,
              end: paddingInEnd ?? 14.sp,
              bottom: bottomPadding ?? 0),
          child: widget,
        ),
      ),
    );
  }
}
