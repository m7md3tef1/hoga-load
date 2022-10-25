import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_button.dart';
import 'package:hoga_load/widgets/widgets/custom_checkbox.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';
import 'package:hoga_load/widgets/widgets/custom_text_field.dart';

import '../../core/widgets/custom_card.dart';

part 'units/form.dart';

class AddUpdateCardView extends StatelessWidget {
  const AddUpdateCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppbar(title: 'Add / Update Card Details'),

            const Expanded(child: SingleChildScrollView(
                physics:BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(top: 22.0),
                  child: Form(),
                ))),          ],
        ),
      ),
    );
  }
}
