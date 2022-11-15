import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/data/models/loads/GetLoads_model.dart';
import '../../../core/data/models/product/GetProduct_model.dart';
import '../../../core/data/models/vehicle/vehicles.dart';
import '../../../widgets/widgets/custom_appbar.dart';
import '../../../widgets/widgets/custom_container_load_detail.dart';
import '../../../widgets/widgets/custom_container_product_detail.dart';
import '../../../widgets/widgets/custom_scaffold.dart';
import '../../home/view.dart';
class Detail extends StatelessWidget {
  Detail(this.load, {super.key}) ;
  GetProductModel? load;

  GlobalKey<ScaffoldState> scaffoldKey=GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        key:scaffoldKey ,
        drawer: const OnDrawer(),
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAppbar(title: 'View Product',scaffoldKey: scaffoldKey,),
          Expanded(child: Column(
            children: [
              Expanded(child: CustomContainerProduct(load!)),
            ],
          )),
          SizedBox(height: 22.h,)
        ],
      ),
    ));
  }
}
