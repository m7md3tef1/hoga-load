import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hoga_load/core/app_images/app_images.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/core/data/models/product/GetProduct_model.dart';
import 'package:hoga_load/features/jobs/cubit/getJop_cubit.dart';
import 'package:hoga_load/features/loads/cubit/getLoad_cubit.dart';
import 'package:hoga_load/features/search_product/cubit/getProduct_cubit.dart';

import '../../features/vehicles/get_vehicles/cubit/vehicle_cubit.dart';

class CustomSearchRow extends StatelessWidget {
  int index;
  var function;

  CustomSearchRow(this.index, {super.key, this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.sp),
      child: Row(
        children: [
          Expanded(
            child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white),
                child: Center(
                  child: TextFormField(
                    onFieldSubmitted: (val) {
                      print('hhhhhhhhhhhhhhhhhhhhhhhhh');
                      print(val);

                      index == 1
                          ? VehiclesCubit.get(context)
                              .getVehicleCubit(val: val.trim())
                          : index == 2
                              ? LoadsCubit.get(context)
                                  .getLoad(val: val.trim(), isFilter: false)
                              : index == 3
                                  ? ProductsCubit.get(context)
                                      .getProduct(val: val.trim(), self: 0)
                                  : index == 4
                                      ? JopCubit.get(context).searchJop(
                                          context,
                                          val.trim(),
                                        )
                                      : null;
                    },
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search_outlined,
                        ),
                        hintText: 'Enter keywords to search',
                        hintStyle: TextStyle(
                            color: ColorManager.lightGrey, fontSize: 14.sp),
                        border: InputBorder.none),
                  ),
                )),
          ),
          SizedBox(
            width: 10.sp,
          ),
          InkWell(
            onTap: function,
            child: Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.orangeAccent),
              child: Center(
                child: SvgPicture.asset(AppImages.slider),
              ),
            ),
          )
        ],
      ),
    );
  }
}
