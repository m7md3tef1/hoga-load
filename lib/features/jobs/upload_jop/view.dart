import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/core/router/router.dart';
import 'package:hoga_load/features/home/view.dart';
import 'package:hoga_load/features/jobs/upload_jop/units/button.dart';
import 'package:hoga_load/features/jobs/upload_jop/units/table_data.dart';
import 'package:hoga_load/features/upload_product/add_view.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_button.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';
import 'package:hoga_load/widgets/widgets/upgrade_member_ship.dart';

import '../../../core/widgets/custom_card.dart';
import '../../../core/widgets/custom_card_title.dart';
import '../../../core/widgets/custom_no_container.dart';
import '../../../widgets/widgets/upgrade_member.dart';
import '../../loads/uploaded_loads/view.dart';
import '../cubit/getJop_cubit.dart';
import '../cubit/getJop_states.dart';
import 'add_view.dart';

part 'units/uploaded.dart';

class UploadJobsView extends StatefulWidget {
  const UploadJobsView({Key? key}) : super(key: key);

  @override
  State<UploadJobsView> createState() => _UploadJobsViewState();
}

class _UploadJobsViewState extends State<UploadJobsView> {
  GlobalKey<ScaffoldState> uploadedJobsScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    JopCubit.get(context).getJops(self: 1, isFilter: false, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: OnDrawer(),
        key: uploadedJobsScaffoldKey,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppbar(
              title: 'Uploaded Jobs',
              scaffoldKey: uploadedJobsScaffoldKey,
            ),
            const Expanded(child: Uploaded()),
          ],
        ),
      ),
    );
  }
}
