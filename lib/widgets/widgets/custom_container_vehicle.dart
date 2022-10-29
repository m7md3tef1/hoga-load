import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hoga_load/core/app_images/app_images.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/core/widgets/custom_card.dart';
import 'package:hoga_load/features/blogs/blog_details.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';

import '../../core/data/models/GetVehicle_model.dart';
import '../../core/data/models/blogs.dart';
import '../../core/data/models/vehicles.dart';
import '../../core/router/router.dart';

class CustomContainerVehicle extends StatelessWidget {
  final Vehicles vehicle;
  CustomContainerVehicle(this.vehicle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      paddingInEnd: 0,
      paddingInStart: 0,
      bottomPadding: 0,
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
      Padding(
            padding: EdgeInsets.only(top: 15.h, ),
            child: Container(
              height: 100.h,
              width: 1.sw,
              child: Column(
              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: '${vehicle.originCountry!.title}  City ',
                        fontSize: 18.sp,

                        fontWeight: FontWeight.w600,
                        color: ColorManager.primaryColor,
                      ),
                      CustomText(
                        text: '(${vehicle.originState!.title})',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorManager.primaryColor,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: vehicle.destinationCity!.title ?? 'other',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorManager.primaryColor,
                      ),
                      CustomText(
                        text: '→',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorManager.primaryColor,
                      ),

                      CustomText(
                        text: '(${vehicle.destinationState!.title})',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorManager.primaryColor,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          
          Padding(
            padding: EdgeInsets.only(top: 15.h,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.person_outline,
                      color: ColorManager.primaryColor,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    CustomText(
                      text: vehicle.user!.username,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.access_time_outlined,
                        color: ColorManager.primaryColor,
                      ),
                      Expanded(
                        child: CustomText(
                          align: TextAlign.start,
                          text: vehicle.createdAt!
                              .substring(0, vehicle.createdAt!.indexOf('T')),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/images/Chat_Circle_Dots.svg',
                        height: 25.h,
                        width: 25.w,
                        fit: BoxFit.cover,
                        color: ColorManager.primaryColor,
                      ),
                      Expanded(
                        child: CustomText(
                          text: '${vehicle.weight} Kg(s)',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(
            height: 7.h,
            width: .7.sw,
            child: const Divider(),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 15.h),
            child: Row(
            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    CustomText(text: 'CONTACT DETAILS'),
                    Row(
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          color: ColorManager.primaryColor,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        CustomText(
                          text: vehicle.user!.email,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.phone_callback,
                          color: ColorManager.primaryColor,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        CustomText(
                          text: vehicle.user!.contactNumber,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
