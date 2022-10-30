import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/core/router/router.dart';
import 'package:hoga_load/features/add_vehicle/view.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_button.dart';
import 'package:hoga_load/widgets/widgets/custom_row.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';

import '../../core/widgets/custom_card.dart';
import '../../core/widgets/custom_card_title.dart';
import '../../core/widgets/custom_no_container.dart';

part 'units/uploaded.dart';
part 'units/button.dart';
class UploadVehiclesView extends StatelessWidget {
  const UploadVehiclesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body:
      Column(
        children: [
          CustomAppbar(title: 'Uploadeconst d VEHICLES'),
          const Expanded(child: Uploaded()),
        ],
      ),
    );
  }
}