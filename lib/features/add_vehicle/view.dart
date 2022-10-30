import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_button.dart';
import 'package:hoga_load/widgets/widgets/custom_checkbox.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';
import 'package:hoga_load/widgets/widgets/custom_text_field.dart';

import '../../core/keys/keys.dart';
import '../../core/master_cubit/getDataForm_state.dart';
import '../../core/widgets/custom_card.dart';
import '../../core/master_cubit/getDataForm_cubit.dart';
import 'cubit/getVehicle_cubit.dart';
import 'cubit/getVehicle_states.dart';

part 'units/attributes.dart';
part 'units/equipment.dart';
part 'units/form.dart';
part 'units/instructon.dart';
part 'units/vehicle_type.dart';
part 'units/vehicles_size.dart';
class AddVehiclesView extends StatelessWidget {
  const AddVehiclesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: BlocConsumer<VehiclesCubit,AddVehicleStates>(
          listener: (BuildContext context, state) {  },
          builder: (context,state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAppbar(title: 'Add a New Vehicle'),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                           Padding(
                            padding: EdgeInsets.only(top:22),
                            child: FormInfo(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:22),
                            child: Equipment(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:22),
                            child: Attributes(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:22),
                            child: VehicleType(),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top:22),
                            child: VehiclesSize(),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top:22),
                            child: Instructions(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),



              ],
            );
          },
        ),
      ),
    );
  }
}
