import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/features/plans/cubit/plans_states.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';

import '../../widgets/widgets/custom_appbar.dart';
import '../../widgets/widgets/custom_text.dart';
import '../home/units/homebage/buy_container.dart';
import 'cubit/plans_cubit.dart';
part 'units/body.dart';

class PlanView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(

        body:
    Column(
      children: [
        CustomAppbar(title: 'SUBSCRIPTION PLANS'),
        SizedBox(height: 22.h,),
        Expanded(child:
        SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: PlanBody())),
      ],
    ));
  }
}

