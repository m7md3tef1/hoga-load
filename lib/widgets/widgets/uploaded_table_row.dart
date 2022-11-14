import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/color_manager/color_manager.dart';
import '../../core/dialoges/delete_dialoge.dart';
import 'custom_text.dart';

class UploadedTableDataRow extends StatelessWidget {
   UploadedTableDataRow({super.key,required this.deleteFunc,
   required this.editFunc,this.flex,this.flex2, this.tableWeight,required this.origin,required this.tableNumber});
   String? tableNumber;
   String? tableWeight;
   String? origin;
   var editFunc;
   var deleteFunc;
   var flex;
   var flex2;
   @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:  const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: CustomText(
              text: tableNumber,
              align: TextAlign.start,
              fontSize: 8.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            flex: flex ?? 8,
            child: CustomText(
              text: origin,
              align: TextAlign.start,
              fontSize: 8.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            flex:flex2?? 2,
            child: CustomText(
              text: tableWeight,
              align: TextAlign.start,
              fontSize: 8.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                InkWell(
                  onTap:(){
                    showDialog(context: context, builder:(context)=> DeleteEditDialog(function: editFunc,btnText: 'Edit',));

                  },
                  child: CustomText(
                    text: 'Edit',
                    align: TextAlign.start,
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w200,
                    color: ColorManager.primaryColor,
                  ),
                ),
                SizedBox(width: 5.sp,),
                InkWell(
                  onTap:(){
                    showDialog(context: context, builder:(context)=> DeleteEditDialog(function: deleteFunc,btnText: 'Delete',));
                  },
                  child: CustomText(
                    text: 'Delete',
                    align: TextAlign.start,
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w200,
                    color: Colors.red,
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
