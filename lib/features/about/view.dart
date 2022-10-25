import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/app_images/app_images.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/features/about/units/value_container.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'units/small_container.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';

part 'units/body.dart';
part 'units/contact.dart';
part 'units/video.dart';
part 'units/our_values.dart';
class AboutUsView extends StatelessWidget {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppbar(title: 'About Us'),
            SizedBox(
              height: 22.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const Body(),
                    SizedBox(
                      height: 38.h,
                    ),
                    const Video(),
                    const Values(),
                    const Contact()
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
