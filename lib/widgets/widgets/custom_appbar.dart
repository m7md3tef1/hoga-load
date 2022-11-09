import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hoga_load/core/app_images/app_images.dart';
import 'package:hoga_load/features/dashboard/view.dart';
import 'package:hoga_load/features/home/view.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';

import '../../core/router/router.dart';

class CustomAppbar extends StatelessWidget {
  String title;
  var icon;
   CustomAppbar({Key? key,  required this.title,this.icon}) : super(key: key) ;


  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Container(
          color: Colors.white,
          height: 65,
          width: 1.sw,
          child:
          Center(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 InkWell(
                     onTap: (){
                       Scaffold.of(context).openDrawer();
                       //MagicRouter.navigateTo( const OnDrawer());
                     },
                     child: SvgPicture.asset(AppImages.menu)),

                  Center(
                    child: CustomText(
                      text: title,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                   icon ?? InkWell(
                       onTap: (){
                         MagicRouter.navigateTo( const DashboardView());
                       },
                       child: const Icon(Icons.account_circle_outlined)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
