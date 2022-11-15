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
  GlobalKey<ScaffoldState>? scaffoldKey;
  bool? hideIcons;
  CustomAppbar(
      {Key? key,
      required this.title,
      this.icon,
      this.hideIcons,
      this.scaffoldKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.white,
          height: 65,
          width: 1.sw,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Row(
                mainAxisAlignment:
                    (hideIcons == null || !hideIcons!) && icon != null
                        ? MainAxisAlignment.spaceBetween
                        : (hideIcons == null || !hideIcons!)
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.center,
                children: [
                  if (hideIcons == null || !hideIcons!)
                    Builder(
                      builder: (context) {
                        return InkWell(
                            onTap: () {
                              print('clicked');
                              print(scaffoldKey);
                              Scaffold.of(context).openDrawer();

                              if (scaffoldKey != null) {
                                print('clicked2');

                                scaffoldKey!.currentState!.openDrawer();
                              } else {

                                Home.scaffoldStateKey.currentState!.openDrawer();

                              }
                              //MagicRouter.navigateTo( const OnDrawer());
                            },
                            child: SvgPicture.asset(AppImages.menu));
                      }
                    ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: CustomText(
                        text: title,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  if ((hideIcons == null || !hideIcons!))
                    InkWell(
                        onTap: () {
                          MagicRouter.navigateTo(const DashboardView());
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
