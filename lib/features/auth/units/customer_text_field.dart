import 'package:flutter/material.dart';

import '../../../core/color_manager/color_manager.dart';

class CustomTextFormField extends StatelessWidget {
  var prefixIcon;
  var suffixIcon;
  String? hintText;
  var keyBoardType;
  var controller;
  var validate;
  var function;

  CustomTextFormField({super.key, this.prefixIcon, this.suffixIcon, this.hintText,this.controller,
      this.validate,this.function,this.keyBoardType,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: TextFormField(
        validator: validate,
        controller: controller,
        keyboardType: keyBoardType,
        decoration: InputDecoration(
          focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: ColorManager.orange,width: 1),
            borderRadius: BorderRadius.circular(12),



          ) ,
            border: OutlineInputBorder(

              borderSide: BorderSide(color: ColorManager.lightGrey,width: 1,),
              borderRadius: BorderRadius.circular(12),



            ) ,

            hintText: hintText!,
             hintStyle: TextStyle(color:ColorManager.lightGrey)

      ),



      ),
    );
  }
}