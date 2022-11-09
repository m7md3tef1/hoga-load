import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/data/models/vehicle/vehicles.dart';
import '../../../widgets/widgets/custom_appbar.dart';
import '../../../widgets/widgets/custom_container_vehicle_detail.dart';
import '../../../widgets/widgets/custom_scaffold.dart';
class Detail extends StatelessWidget {
  Detail(this.vehicle, {super.key}) ;
  Vehicles? vehicle;

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
              Expanded(child: CustomContainerVehicle(vehicle!)),
            ],
          )),
          SizedBox(height: 22.h,)
        ],
      ),
    );
  }
}
