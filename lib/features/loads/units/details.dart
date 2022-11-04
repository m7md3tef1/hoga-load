import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/data/models/loads/GetLoads_model.dart';
import '../../../core/data/models/vehicle/vehicles.dart';
import '../../../widgets/widgets/custom_appbar.dart';
import '../../../widgets/widgets/custom_container_load_detail.dart';
import '../../../widgets/widgets/custom_scaffold.dart';
class Detail extends StatefulWidget {
  Detail(this.load, {super.key}) ;
  GetLoadsModel? load;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAppbar(title: 'View Loads'),
          Expanded(child: Column(
            children: [
              Expanded(child: CustomContainerLoad(widget.load!)),
            ],
          )),
          SizedBox(height: 22.h,)
        ],
      ),
    );
  }
}