import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/router/router.dart';
<<<<<<< HEAD:lib/features/vehicles/view.dart
import 'package:hoga_load/features/vehicles/filter_page.dart';
import 'package:hoga_load/features/vehicles/units/details.dart';
=======
import 'cubit/vehicle_cubit.dart';
import 'cubit/vehicle_states.dart';
import 'details.dart';
import 'filter_page.dart';
>>>>>>> nada:lib/features/vehicles/get_vehicles/view.dart
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_row.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';

part '../get_vehicles/units/body.dart';
class VehiclesView extends StatelessWidget {
  const VehiclesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body:
<<<<<<< HEAD:lib/features/vehicles/view.dart
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
=======
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAppbar(title: 'Vehicles'),
          SizedBox(height: 22.h,),
           CustomSearchRow(1,function: (){
             MagicRouter.navigateTo(FilterVehicle());
           },),
          SizedBox(height: 21.h,),
           Body()
        ],

>>>>>>> nada:lib/features/vehicles/get_vehicles/view.dart
      ),
    );
  }
}