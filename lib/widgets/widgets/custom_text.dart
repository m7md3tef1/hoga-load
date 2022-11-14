import 'package:flutter/material.dart';

import '../../core/color_manager/color_manager.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String? text;
  Color? color;
  double? fontSize;
  var fontWeight;
  var align;
  var height;
  var textHeight;
  var textDirection;
  var width;
  TextDecoration? textDecoration;

  CustomText(
      {Key? key,
        this.textDecoration,
        this.textDirection,
        this.width,
        this.height,
        this.align,
        this.textHeight,
        required this.text,
        this.color = ColorManager.blackColor,
         this.fontSize,
        this.fontWeight = FontWeight.bold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Center(
        child: Text(

          text!,
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: textHeight,
             decoration: textDecoration
          ),

          maxLines: 11,
          textAlign: align,
        ),
      ),
    );
  }
}
