import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/router/router.dart';
import 'package:hoga_load/features/vehicles/filter_page.dart';
import 'package:hoga_load/features/vehicles/units/details.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_row.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';

import '../add_vehicle/cubit/getVehicle_cubit.dart';
import '../add_vehicle/cubit/getVehicle_states.dart';

part 'units/body.dart';
class VehiclesView extends StatelessWidget {
  const VehiclesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body:
      SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppbar(title: 'Vehicles'),
            SizedBox(height: 22.h,),
             CustomSearchRow(1,function: (){
               MagicRouter.navigateTo(FilterVehicle());
             },),
            SizedBox(height: 21.h,),
             Expanded(child: Body())
          ],
        ),
      ),
    );
  }
}