
import 'package:flutter/material.dart';
import 'package:hoga_load/features/auth/units/customer_button.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';

import '../../features/auth/domain/auth_cubit.dart';


class DeleteEditDialog extends StatelessWidget {
   DeleteEditDialog({super.key,this.function,this.btnText});
  Function? function;
  String? btnText;

  @override
  Widget build(BuildContext context) {
    return
      AlertDialog(
              title: Center(child:  CustomText(text: 'HegaLoad',)),
              content:  Text(('Warning! Are you sure to ' '${btnText!.toLowerCase()}'' this record?'),),
              actions: [
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(text: 'Cancel', function: (){
                        Navigator.pop(context);
                      },color: Colors.white,),
                    ),

                    Expanded(child: CustomButton(text: btnText, function: function)),

                  ],
                ),

              ],
            );

  }
}
