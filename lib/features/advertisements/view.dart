import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/core/router/router.dart';
import 'package:hoga_load/core/widgets/custom_card.dart';
import 'package:hoga_load/core/widgets/custom_card_title.dart';
import 'package:hoga_load/core/widgets/custom_no_container.dart';
import 'package:hoga_load/features/upload_product/add_view.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_button.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';

part 'units/button.dart';
part 'units/upload_load.dart';
class AdvertisementView extends StatelessWidget {
  const AdvertisementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(title: 'Advertisements'),
            const Expanded(child: UploadedLoad()),

          ],
        ),
      ),
    );
  }
}
