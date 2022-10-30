import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  var function;
  String? text;
  var width;
  var color;
  var colorborder;
  var colortext;
  var font;
  var icon;
  CustomButton(
      {Key? key,
      this.function,
      this.colorborder,
      this.colortext,
      required this.text,
      this.font,
      this.width,
      this.icon,
      required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
          width: 320.w,
          height: 48.h,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                  color:
                      colorborder == null ? Colors.transparent : colorborder)),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              CustomText(
                text: text,
                color: colortext == null ? Colors.black : colortext,
                fontSize: font == null ? 20.sp : font,
                fontWeight: FontWeight.w600,
              ),
            ],
          ))),
    );
  }
}
