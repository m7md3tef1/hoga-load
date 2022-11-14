import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/features/jobs/cubit/getJop_cubit.dart';
import 'package:hoga_load/features/jobs/cubit/getJop_states.dart';
import 'package:hoga_load/features/jobs/units/details.dart';
import 'package:hoga_load/features/jobs/upload_jop/add_view.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_row.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/router/router.dart';

part 'units/body.dart';

class JobsView extends StatelessWidget {
  const JobsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppbar(title: 'Jobs'),
            SizedBox(
              height: 22.h,
            ),
            CustomSearchRow(
              4,
              function: () {
                MagicRouter.navigateTo(AddJopView(
                  isFilter: true,
                ));
              },
            ),
            SizedBox(
              height: 21.h,
            ),
            Body()
          ],
        ),
      ),
    );
  }
}
