import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/core/router/router.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../core/widgets/custom_card_title.dart';
import '../add_vehicle/view.dart';
import '../get_vehicles/cubit/vehicle_cubit.dart';
import '../get_vehicles/cubit/vehicle_states.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';
import 'package:hoga_load/widgets/widgets/custom_button.dart';
import 'package:hoga_load/widgets/widgets/custom_scaffold.dart';
import 'package:hoga_load/widgets/widgets/uploaded_table_row.dart';
import 'package:hoga_load/widgets/widgets/uploaded_table_title.dart';
part '../upload_vehicles/units/uploaded.dart';
part '../upload_vehicles/units/button.dart';
part '../upload_vehicles/units/my_table.dart';


class UploadVehiclesView extends StatefulWidget {
  const UploadVehiclesView({Key? key}) : super(key: key);

  @override
  State<UploadVehiclesView> createState() => _UploadVehiclesViewState();
}

class _UploadVehiclesViewState extends State<UploadVehiclesView> {

  @override
  void initState() {
    super.initState();
    VehiclesCubit.get(context).getVehicleCubit(self: 1);
  }
  Widget build(BuildContext context) {
    return CustomScaffold(
      body:
      Column(
        children: [
          CustomAppbar(title: 'Uploaded VEHICLES'),
          const Expanded(child: Uploaded()),
           //MyTable(),

        ],
      ),
    );
  }
}