import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/data/models/vehicle/vehicles.dart';
import '../../../../widgets/widgets/custom_appbar.dart';
import '../../../../widgets/widgets/custom_container_load_detail.dart';
import '../../../../widgets/widgets/custom_scaffold.dart';
import '../../../home/view.dart';
class Detail extends StatelessWidget {
  Detail(this.load, {super.key}) ;
  Vehicles? load;

  GlobalKey<ScaffoldState> scaffoldKey=GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        key:scaffoldKey ,
        drawer: const OnDrawer(),
      body:
      SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppbar(title: 'View Loads',scaffoldKey: scaffoldKey,),
            CustomContainerLoad(load!),
            SizedBox(height: 22.h,)
          ],
        ),
      ),
    ));
  }
}
