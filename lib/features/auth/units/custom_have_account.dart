import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/router/router.dart';
import 'package:hoga_load/features/auth/login.dart';

import '../../../core/color_manager/color_manager.dart';
import '../../../widgets/widgets/custom_text.dart';
class HaveAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(text: 'Do you have account?',fontWeight: FontWeight.bold,fontSize: 14.sp,color: ColorManager.greyColor, ),
          InkWell(onTap: (){MagicRouter.navigateTo(Login());},
              child: CustomText(text: '  Login',fontWeight: FontWeight.bold,fontSize: 14.sp,color: ColorManager.yellow, )),

        ],
      ),
    )
    ;
  }
}
