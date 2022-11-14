import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/custom_card.dart';
import '../../core/widgets/custom_card_title.dart';
import '../../core/widgets/custom_no_container.dart';
import '../../features/jobs/upload_jop/units/button.dart';
import '../../features/vehicles/upload_vehicles/view.dart';

class Upgrade extends StatelessWidget {
  Upgrade({super.key});
  bool isUpgradeMember = true;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      widget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 11.sp),
        child: Column(
          children: [
            SizedBox(
              height: 18.h,
            ),
            CustomCardTitle(
              text: 'UPLOADED Job',
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomNoContainer(
                      text: 'Job', isUpgradeMember: isUpgradeMember),
                ],
              ),
            ),
            Button1(isUpgradeMember: isUpgradeMember),
          ],
        ),
      ),
    );
  }
}
