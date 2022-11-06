import 'package:flutter/material.dart';
import 'package:hoga_load/core/router/router.dart';

import '../../../core/color_manager/color_manager.dart';
import '../../../widgets/widgets/custom_text.dart';
import '../sign_up.dart';

class NoAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(text: 'You don\'t have account?',fontWeight: FontWeight.bold,fontSize: 14,color: ColorManager.greyColor, ),
          InkWell(onTap: (){MagicRouter.navigateTo(SignUp());},
              child: CustomText(text: '  Sign Up',fontWeight: FontWeight.bold,fontSize: 14,color: ColorManager.yellow, )),

        ],
      ),
    )
    ;
  }
}
