import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/data/models/GetVehicle_model.dart';
import '../../../core/data/models/vehicles.dart';
import '../../../widgets/widgets/custom_appbar.dart';
import '../../../widgets/widgets/custom_container_vehicle.dart';
import '../../../widgets/widgets/custom_scaffold.dart';

class VehicleDetail extends StatefulWidget {
   VehicleDetail(this.vehicle) ;
   Vehicles? vehicle;

  @override
  State<VehicleDetail> createState() => _VehicleDetailState();
}

class _VehicleDetailState extends State<VehicleDetail> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAppbar(title: 'View Vehicles'),
          Expanded(child: Column(
            children: [
              Expanded(child: CustomContainerVehicle(widget.vehicle!)),
            ],
          )),
          SizedBox(height: 22.h,)
        ],
      ),
    );
  }
}
