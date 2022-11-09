import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/core/router/router.dart';
import 'package:hoga_load/features/upload_product/add_view.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_button.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';

import '../../../core/widgets/custom_card.dart';
import '../../../core/widgets/custom_card_title.dart';
import '../../../core/widgets/custom_no_container.dart';
import '../../loads/uploaded_loads/view.dart';
import 'add_view.dart';

part 'units/button.dart';
part 'units/uploaded.dart';

class UploadJobsView extends StatelessWidget {
  const UploadJobsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAppbar(title: 'Up loaded Jobs'),
          const Expanded(child: Uploaded()),
        ],
      ),
    );
  }
}