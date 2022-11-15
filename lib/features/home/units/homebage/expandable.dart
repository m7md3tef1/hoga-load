import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';

class Expandable extends StatelessWidget {
   Expandable(this.text,this.desc, {super.key});
String? text;
String? desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ExpandablePanel(
        header: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              CustomText(text: text,align:TextAlign.start,fontSize: 16.sp,fontWeight: FontWeight.w600,color: const Color(0xFF000000),),
              SizedBox(
                width: 1.sw,child: const Divider(thickness: 1.5,),),
            ],
          ),
        ),


        expanded: Column(
          children: [
            CustomText(text: desc,fontSize: 14.sp,fontWeight: FontWeight.w600,color: const Color(0xFF7B7B7B),),
          ],
        ),
        collapsed: const Text('', softWrap: true, ),

      ),
    );
  }
}