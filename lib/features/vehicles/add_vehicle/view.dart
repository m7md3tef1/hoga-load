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
class AddVehiclesView extends StatefulWidget {
   AddVehiclesView({Key? key,this.vehiclesModel,this.isEdit=false,this.index,this.isLoad=false}) : super(key: key);
  Vehicles? vehiclesModel;
  bool isEdit;
  int? index;
  bool isLoad;

  @override
  State<AddVehiclesView> createState() => _AddVehiclesViewState();
}

class _AddVehiclesViewState extends State<AddVehiclesView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: BlocConsumer<VehiclesCubit,VehicleStates>(
          listener: (BuildContext context, state) {
            if(state is AddSuccess){
              Navigator.pop(context);
              VehiclesCubit.get(context).getVehicleCubit(self: 1);
            }
            if(state is EditSuccess){
              Navigator.pop(context);
              Navigator.pop(context);

            }
          },
          builder: (context,state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAppbar(title:widget.isLoad?"Add a New Load":widget.isEdit?"Edit Vehicle": 'Add a New Vehicle'),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                           Padding(
                            padding: const EdgeInsets.only(top:22),
                            child:
                            FormInfo(vehiclesModel: widget.vehiclesModel,isEdit: widget.isEdit,index: widget.index,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:22),
                            child: Equipment(vehiclesModel: widget.vehiclesModel,isEdit:widget.isEdit),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:22),
                            child: Attributes(vehiclesModel: widget.vehiclesModel,isEdit:widget.isEdit),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:22),
                            child: VehicleType(vehiclesModel: widget.vehiclesModel,isEdit:widget.isEdit),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:22),
                            child: VehiclesSize(vehiclesModel: widget.vehiclesModel,isEdit:widget.isEdit),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top:22),
                            child: Instructions(),
                          ),
                          InkWell(
                              onTap: ()async{
                                widget.isLoad?  await LoadsCubit.get(context).addLoadsCubit(context:context):

                                widget.isEdit==false?
                                await VehiclesCubit.get(context).addVehicleCubit(context:context):
                                await VehiclesCubit.get(context).editVehicleCubit
                                  (context:context,vehicleId:widget.vehiclesModel!.id);

                              },
                              child: CustomButton(text:widget.isLoad?"Add Load":
                              widget.isEdit?"Edit Vehicle": 'Add new vehicle', color: ColorManager.yellow)),

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
