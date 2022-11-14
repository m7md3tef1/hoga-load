
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/color_manager/color_manager.dart';
import '../../../../core/router/router.dart';
import '../../../../widgets/widgets/custom_button.dart';
import '../../../plans/view.dart';
import '../add_view.dart';

class Button1 extends StatelessWidget {

  Button1({super.key,this.isUpgradeMember=false});
  bool isUpgradeMember;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 27.h),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: CustomButton(text: '+ Add',icon: Icons.add, color: ColorManager.yellow,
          function: (){
            isUpgradeMember? MagicRouter.navigateTo( PlanView()):

            MagicRouter.navigateTo(  AddJopView());
          },
        ),
      ),
    );
  }
}
