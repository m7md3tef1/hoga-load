import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/core/data/models/vehicle/vehicles.dart';
import 'package:hoga_load/features/loads/cubit/getLoad_cubit.dart';
import 'package:hoga_load/features/search_product/cubit/getProduct_cubit.dart';

import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_button.dart';
import 'package:hoga_load/widgets/widgets/custom_checkbox.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';
import 'package:hoga_load/widgets/widgets/custom_text_field.dart';

import '../../../core/keys/keys.dart';
import '../../../core/master_cubit/getDataForm_cubit.dart';
import '../../../core/master_cubit/getDataForm_state.dart';
import '../../../core/widgets/custom_card.dart';
import '../get_vehicles/cubit/vehicle_cubit.dart';
import '../get_vehicles/cubit/vehicle_states.dart';

part 'units/attributes.dart';
part 'units/equipment.dart';
part 'units/form.dart';
part 'units/instructon.dart';
part 'units/vehicle_type.dart';
part 'units/vehicles_size.dart';

class AddVehiclesView extends StatelessWidget {
  AddVehiclesView(
      {Key? key,
      this.vehiclesModel,
      this.isEdit = false,
      this.index,
      this.isLoad = false,
      this.isLoadEdit = false,
      this.isLoadFilter = false})
      : super(key: key);
  Vehicles? vehiclesModel;
  bool isEdit;
  int? index;
  bool isLoad;
  bool isLoadFilter;
  bool isLoadEdit;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: BlocConsumer<VehiclesCubit, VehicleStates>(
          listener: (BuildContext context, state) {
            if (state is AddSuccess) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAppbar(
                    title: isLoadEdit
                        ? 'Edit Load'
                        : isLoadFilter
                            ? 'Search'
                            : isLoad
                                ? "Add a New Load"
                                : isEdit
                                    ? "Edit Vehicle"
                                    : 'Add a New Vehicle'),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 22),
                            child: FormInfo(
                              vehiclesModel: vehiclesModel,
                              isEdit: isEdit,
                              index: index,
                              isFilter: isLoadFilter,

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 22),
                            child: Equipment(
                                vehiclesModel: vehiclesModel, isEdit: isEdit),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 22),
                            child: Attributes(
                                vehiclesModel: vehiclesModel, isEdit: isEdit),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 22),
                            child: VehicleType(
                                vehiclesModel: vehiclesModel, isEdit: isEdit),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 22),
                            child: VehiclesSize(
                                vehiclesModel: vehiclesModel, isEdit: isEdit),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 22),
                            child: Instructions(),
                          ),
                          state is AddingLoad
                              ? Center(
                                  child: Container(
                                      height: 30,
                                      width: 30,
                                      child: CircularProgressIndicator()))
                              : InkWell(
                                  onTap: () async {
                                    if (isLoadFilter) {
                                      print(
                                          '#!@#! ${VehiclesCubit.get(context).vehcleSize.toString()}');
                                      await LoadsCubit.get(context).getLoad(
                                          context: context,
                                          isFilter: true,
                                          equipmentSize2:
                                              VehiclesCubit.get(context)
                                                  .equipmentType
                                                  .toString()
                                                  .replaceAll(",", "-")
                                                  .replaceAll("[", "")
                                                  .replaceAll("]", "")
                                                  .replaceAll(" ", ""),
                                          attributes2:
                                              VehiclesCubit.get(context)
                                                  .attributes
                                                  .toString()
                                                  .replaceAll(",", "-")
                                                  .replaceAll("[", "")
                                                  .replaceAll("]", "")
                                                  .replaceAll(" ", ""),
                                          vehicleSize2:
                                              VehiclesCubit.get(context)
                                                  .vehcleSize
                                                  .toString()
                                                  .replaceAll(",", "-")
                                                  .replaceAll("[", "")
                                                  .replaceAll("]", "")
                                                  .replaceAll(" ", ""),
                                          vehicleType2:
                                              VehiclesCubit.get(context)
                                                  .vehcleType
                                                  .toString()
                                                  .replaceAll(",", "-")
                                                  .replaceAll("[", "")
                                                  .replaceAll("]", "")
                                                  .replaceAll(" ", ""));
                                      Navigator.pop(context);
                                    } else if (isLoadEdit) {
                                      await LoadsCubit.get(context)
                                          .editLoadsCubit(
                                              context: context,
                                              vehicleId: vehiclesModel!.id);
                                      Navigator.pop(context);
                                    } else {
                                      isLoad
                                          ? await VehiclesCubit.get(context)
                                              .addVehicleCubit(
                                                  context: context,
                                                  isLoad: true)
                                          : isEdit == false
                                              ? await VehiclesCubit.get(context)
                                                  .addVehicleCubit(
                                                      context: context,
                                                      isLoad: false)
                                              : await VehiclesCubit.get(context)
                                                  .editVehicleCubit(
                                                      context: context,
                                                      vehicleId:
                                                          vehiclesModel!.id);
                                    }
                                  },
                                  child: CustomButton(
                                      text: isLoadEdit
                                          ? 'Edit Load'
                                          : isLoad
                                              ? "Add Load"
                                              : isLoadFilter
                                                  ? 'Search'
                                                  : isEdit
                                                      ? "Edit Vehicle"
                                                      : 'Add new vehicle',
                                      color: ColorManager.yellow)),
                          SizedBox(
                            height: 10,
                          )
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
