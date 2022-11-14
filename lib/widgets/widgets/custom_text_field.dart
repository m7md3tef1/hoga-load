import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/color_manager/color_manager.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  String? title;
  var onSaved;
  var validate;
  var prefixIcon;
  int? maxLength;
  var suffixIcon;
  var hintText;
  bool obscure;
  var keyboardType;
  var controller;
  bool readOnly;
  var lines;
  var height;
  var color;
  var label;
  var name;
  CustomTextField(
      {Key? key,
      this.title,
      this.name,
      this.maxLength,
      this.keyboardType,
      this.readOnly = false,
      this.color,
      this.height,
      this.hintText,
      this.controller,
      this.lines,
      this.onSaved,
      this.validate,
      this.suffixIcon,
      this.obscure = false,
      this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return name != null
        ? Padding(
            padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 14.w),
            child: Container(
              height: 69.h,
              width: 1.sw,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: ColorManager.greyColor)),
              child: Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 14.w),
                    child: Container(
                      height: 15.h,
                      child: Row(
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: ColorManager.greyColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 48.h,
                    child: Padding(
                      padding: EdgeInsets.only(left: 14.0.w, bottom: 0.h),
                      child: TextFormField(
                          obscureText: obscure,
                          onSaved: onSaved,
                          validator: validate,
                          controller: controller,
                          autofocus: false,
                          maxLines: lines,
                          maxLength: maxLength,
                          buildCounter: (context,
                                  {required currentLength,
                                  required isFocused,
                                  maxLength}) =>
                              null,
                          readOnly: readOnly,
                          keyboardType: keyboardType,
                          textDirection: TextDirection.ltr,
                          decoration: InputDecoration(
                            prefixIcon: prefixIcon,
                            suffixIcon: suffixIcon,
                            hintText: hintText,
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: color,
                            ),
                            border: InputBorder.none,
                            focusColor: ColorManager.blackColor,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 14.w),
            child: Container(
              height: height ?? .07.sh,
              width: 1.sw,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: ColorManager.greyColor)),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 14.0.w,
                ),
                child: TextFormField(
                    keyboardType: keyboardType,
                    obscureText: obscure,
                    onSaved: onSaved,
                    validator: validate,
                    maxLength: maxLength,
                    buildCounter: (context,
                            {required currentLength,
                            required isFocused,
                            maxLength}) =>
                        null,
                    controller: controller,
                    autofocus: false,
                    maxLines: lines ?? 1,
                    textDirection: TextDirection.ltr,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: const Color(0xFF3D3D3D),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                      prefixIcon: prefixIcon,
                      suffixIcon: suffixIcon,
                      hintText: hintText,
                      hintStyle: TextStyle(
                        fontSize: 12.sp,
                      ),
                      border: InputBorder.none,
                      focusColor: ColorManager.blackColor,
                    )),
              ),
            ),
          );
  }
}
