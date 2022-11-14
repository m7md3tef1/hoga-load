import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/core/widgets/custom_card.dart';
import 'package:hoga_load/features/loads/cubit/getLoad_cubit.dart';
import 'package:hoga_load/features/vehicles/add_vehicle/view.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';

import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';

import '../../../widgets/widgets/custom_button.dart';

//part '../add_load/units/attributes.dart';
//part '../add_load/units/equipment.dart';
//part '../add_load/units/form.dart';
//part '../add_load/units/instructon.dart';
//part '../add_load/units/vehicle_type.dart';
//part '../add_load/units/vehicles_size.dart';

class AddLoadsView extends StatelessWidget {
  const AddLoadsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppbar(title: 'Add a New Load'),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                              padding: const EdgeInsets.only(top: 22),
                              child: FormInfo())),
                      SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 22),
                            child: Equipment(),
                          )),
                      SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 22),
                            child: Attributes(),
                          )),
                      SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 22),
                            child: VehicleType(),
                          )),
                      SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 22),
                            child: VehiclesSize(),
                          )),
                      const SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Padding(
                            padding: EdgeInsets.only(top: 22),
                            child: Instructions(),
                          )),
                      InkWell(
                          onTap: () async {
                            await LoadsCubit.get(context)
                                .addLoadsCubit(context: context);

//                            isEdit==false?
//                            await VehiclesCubit.get(context).addVehicleCubit(context:context):
//                            await VehiclesCubit.get(context).editVehicleCubit
//                              (context:context,vehicleId:vehiclesModel!.id);
                          },
                          child: CustomButton(
                              text: "Add Load", color: ColorManager.yellow)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
