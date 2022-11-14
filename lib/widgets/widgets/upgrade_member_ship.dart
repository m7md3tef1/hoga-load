import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/custom_card.dart';
import '../../core/widgets/custom_card_title.dart';
import '../../core/widgets/custom_no_container.dart';
import '../../features/upload_product/units/button.dart';

class UpgradeMember extends StatelessWidget {
  UpgradeMember({super.key});
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
              text: 'UPLOADED Vehicles',
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomNoContainer(
                      text: 'vehicles', isUpgradeMember: isUpgradeMember),
                ],
              ),
            ),
            Button(isUpgradeMember: isUpgradeMember),
          ],
        ),
      ),
    );
  }
}
