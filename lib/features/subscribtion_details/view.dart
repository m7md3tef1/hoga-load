
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/core/widgets/custom_card_title.dart';
import 'package:hoga_load/features/subscribtion_details/units/details.dart';
import 'package:hoga_load/features/subscribtion_details/units/facilities.dart';
import 'package:hoga_load/features/subscribtion_details/units/plans.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';
import '../../core/widgets/custom_card.dart';

part 'units/body.dart';
class SubscriptionDetailsView extends StatelessWidget {
  const SubscriptionDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAppbar(title: 'Subscription Details'),
          Expanded(child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
              child: Body())),

        ],
      ),
    );
  }
}