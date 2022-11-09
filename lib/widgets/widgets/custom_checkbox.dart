import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';

import '../../features/vehicles/get_vehicles/cubit/vehicle_cubit.dart';

class CustomCheckBox extends StatefulWidget {
  CustomCheckBox({Key? key, this.value,this.text, this.index, this.boxKey}) : super(key: key);
  bool? value;
String? text;
int? index;
String? boxKey;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 150.w,
      child: Padding(
        padding:  EdgeInsets.only(bottom: 1.h),
        child: Row(
          children: [

            Checkbox(
                value: widget.value,
                onChanged: (val) {
                  setState(() {
                   widget.value =val  ;
                  });
                  VehiclesCubit.get(context).changeCheckBox(widget.boxKey, widget.index,val);
                }),
            CustomText(text: widget.text, fontSize: 14.sp,fontWeight: FontWeight.w500,color: const Color(0xFFAEAEB2),)
          ],
        ),
      ),
    );
  }
}
