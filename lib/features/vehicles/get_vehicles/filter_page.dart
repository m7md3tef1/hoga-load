import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/color_manager/color_manager.dart';
import '../../../widgets/widgets/custom_appbar.dart';
import '../../../widgets/widgets/custom_button.dart';
import '../../../widgets/widgets/custom_scaffold.dart';
import '../add_vehicle/view.dart';
import 'cubit/vehicle_cubit.dart';
import 'cubit/vehicle_states.dart';
class FilterVehicle extends StatelessWidget {
  bool isFilter= true;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: BlocConsumer<VehiclesCubit,VehicleStates>(
          listener: (BuildContext context, state) {
            if(state is GetSearchSuccess||state is GetSearchFailed){
              Navigator.pop(context);

            }
          },
          builder: (context,state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAppbar(title: 'Vehicle'),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                           Padding(
                            padding: const EdgeInsets.only(top:22),
                            child: FormInfo(isFilter:isFilter),
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
                           Padding(
                            padding: const EdgeInsets.only(top:22),
                            child:  InkWell(
                                onTap: ()async{
                                  print('filter Search');
                                 await VehiclesCubit.get(context).getVehicleCubit(
                                     context:context,
                                    isFilter: true,
                                    equipmentSize2:
                                    VehiclesCubit.get(context).equipmentType.toString()
                                        .replaceAll(",","-").replaceAll("[","").replaceAll("]","").
                                    replaceAll(" ",""),
                                    attributes2:
                                    VehiclesCubit.get(context).attributes.toString()
                                        .replaceAll(",","-").replaceAll("[","").replaceAll("]","").
                                    replaceAll(" ",""),
                                    vehicleSize2:
                                    VehiclesCubit.get(context).vehcleSize.toString()
                                        .replaceAll(",","-").replaceAll("[","").replaceAll("]","").
                                    replaceAll(" ",""),
                                    vehicleType2:
                                    VehiclesCubit.get(context).vehcleType.toString()
                                        .replaceAll(",","-").replaceAll("[","").replaceAll("]","").
                                    replaceAll(" ","")

                                  );
                                 Navigator.pop(context);

                                  print(
                                      VehiclesCubit.get(context).equipmentType.toString()
                                      .replaceAll(",","-").replaceAll("[","").replaceAll("]","").
                                  replaceAll(" ",""));
                                },
                                child: CustomButton(text: 'Search', color: ColorManager.yellow)) ,
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
