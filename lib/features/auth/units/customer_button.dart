import 'package:flutter/material.dart';

import '../../../core/color_manager/color_manager.dart';
import '../../../widgets/widgets/custom_text.dart';
class CustomButton extends StatelessWidget {
  String? text;
  var function;
  Color? color;

  CustomButton({required this.text,required this.function,this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.only(top: 18,bottom: 14),
        child: Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              color: color??ColorManager.yellow,
              borderRadius: BorderRadius.circular(10),

            ),
            child: Center(
              child: CustomText(text: text,fontWeight: FontWeight.bold,fontSize: 20,
              ),
            )),
      ),
    );
  }
}
