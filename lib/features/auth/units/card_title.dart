import 'package:flutter/material.dart';

import '../../../core/color_manager/color_manager.dart';
import '../../../widgets/widgets/custom_text.dart';
class TitleText extends StatelessWidget {
  String? title;

  TitleText({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
      return Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 18,bottom: 30),
          child: CustomText(text:title,fontWeight: FontWeight.bold,fontSize: 18,),
        ),
        const Divider(color: ColorManager.lightGrey)
      ],);
  }
}
