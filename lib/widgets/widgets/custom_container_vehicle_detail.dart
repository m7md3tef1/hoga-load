import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hoga_load/core/app_images/app_images.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/core/widgets/custom_card.dart';
import 'package:hoga_load/features/blogs/blog_details.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';


import '../../core/data/models/vehicle/vehicles.dart';
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
            padding: EdgeInsets.only(top: 25.h,left: 8.r,right: 8.r,),
            child: Container(
              height: 80.h,
              width: 1.sw,
              child: Column(
                children: [

                  Row(
                    children: [
                      CustomText(
                        text: vehicle.originCity ==null ?'other':'${vehicle.originCity!.title}',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorManager.primaryColor,
                      ),
                      Expanded(
                        child: CustomText(
                          text:  vehicle.originState ==null ?'other':' (${vehicle.originState!.title},${vehicle.originCountry!.title})' ,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.arrow_right_alt,color:  ColorManager.primaryColor,),
                      CustomText(
                        text: vehicle.destinationCity ==null ? 'other':vehicle.destinationCity!.title.toString(),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorManager.primaryColor,
                      ),

                      Expanded(
                        child: CustomText(
                          text: vehicle.destinationState ==null ? 'other':' (${vehicle.destinationState!.title}, ${vehicle.destinationCountry!.title})',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,

                          color: ColorManager.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
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
                      text: vehicle.user == null
                          ? 'other'
                          : vehicle.user!.username.toString(),
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
                          text: '${vehicle.weight} Kg(s)'??'other Kg(s)',
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

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              height: 7.h,
              width: 1.sw,
              child: const Divider(),
            ),
          ),

          Padding(
            padding:  EdgeInsets.only(top: 15.h),
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 33.w,bottom: 15.h,top: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(text: 'CONTACT DETAILS'),
                    ],
                  ),
                ),

                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(bottom: 15.h,top: 15.h),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.phone_callback,
                            color: ColorManager.primaryColor,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          CustomText(
                            text: vehicle.user == null
                                ? 'other'
                                : vehicle.user!.contactNumber.toString(),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),

                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          color: ColorManager.primaryColor,
                        ),

                        CustomText(
                          text: vehicle.user == null
                              ? 'other'
                              : vehicle.user!.email.toString(),
                          fontSize: 10.sp,
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