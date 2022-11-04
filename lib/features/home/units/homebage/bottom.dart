import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/features/home/units/homebage/buttonContainer.dart';
import 'package:hoga_load/features/home/units/homebage/vehicle_container.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';

import 'buy_container.dart';
import 'features_container.dart';

class Bottom extends StatelessWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: CustomText(
            text: 'OUR BUSINESS USP',
            align: TextAlign.center,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFFFDC52F),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: CustomText(
            text: 'LIST OF FEATURES WE PROVIDE IN HEGALOAD PORTAL',
            align: TextAlign.center,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF000000),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Container(
          height: 190.h,
          width: 1.sw,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              image: const DecorationImage(
                  image: AssetImage('assets/images/Rectangle 21.png'),
                  fit: BoxFit.cover)),
        ),
        FeaturesContainer(' Faster Communication'),
        FeaturesContainer(' Quick item for Sale'),
        FeaturesContainer(' Instant Technical Support'),
        FeaturesContainer(' Easy access to Jobs'),
        FeaturesContainer(' Coverage in Canada & US'),
        FeaturesContainer(' Coverage in Canada & US'),
        SizedBox(
          height: 50.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: CustomText(
            text: 'How We Can Help You In Day To Day Logistics Activity',
            align: TextAlign.center,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF000000),
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonContainer(ColorManager.primaryColor, 'LOADS & VEHICLES'),
            ButtonContainer(const Color(0xFFA9A9A9), 'JOBS'),
            ButtonContainer(const Color(0xFFA9A9A9), 'PRODUCTS'),
          ],
        ),
        SizedBox(
          height: 25.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: CustomText(
            text:
                'Loads and Vehicle management allows you to connect with other users who are either booking a load or moving from one location to another.',
            color: const Color(0xFF535353),
            align: TextAlign.start,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 9.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Row(
            children: [
              const Image(image: AssetImage('assets/images/Vector.png')),
              CustomText(
                text: ' List and search of Loads',
                color: ColorManager.primaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 9.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: CustomText(
            text:
                'Items according to the type, size, durability and convenience can be uploaded in our system and matching vehicle owners can connect with you directly.',
            color: const Color(0xFF535353),
            align: TextAlign.start,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Row(
            children: [
              const Image(image: AssetImage('assets/images/Vector.png')),
              CustomText(
                text: ' List and search of Vehicles',
                color: ColorManager.primaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 9.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: CustomText(
            text:
                'Vehicle owners can list their available vehicle movement according to vehicle type, vehicle size, attributes and type of containers to get contacted from load providers.',
            color: const Color(0xFF535353),
            align: TextAlign.start,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
          child:
              const Image(image: AssetImage('assets/images/Rectangle 26.png')),
        ),
        SizedBox(
          height: 50.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: CustomText(
            text: 'SERVICES',
            align: TextAlign.center,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFFFDC52F),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: CustomText(
            text: 'SERVICES WE PROVIDE FOR YOUR DAILY LOGISTICS NEEDS',
            align: TextAlign.center,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF000000),
          ),
        ),

        VehicleContainer(
            'assets/images/load.png',
            'Loads',
            'Go through our available list of loads.',
            'Read More',
            const Color(0xFF2DB6FA)),
        VehicleContainer(
            'assets/images/load.png',
            'Vehicles',
            'Choose your desired vehicle from our system.',
            'Read More',
            const Color(0xFFF68C09)),
        VehicleContainer(
            'assets/images/product.png',
            'Products',
            'Checkout available item for sale and purchase.',
            'Read More',
            const Color(0xFF08DA4E)),
        VehicleContainer(
            'assets/images/jop.png',
            'Jobs',
            'Upload your jobs here.',
            'Read More',
            const Color(0xFFE9222C)),

        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: CustomText(
            text: 'SUBSCRIPTION PLANS',
            align: TextAlign.center,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFFFDC52F),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: CustomText(
            text: 'CHECK OUR PRICING POLICY',
            align: TextAlign.center,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF000000),
          ),
        ),
        BuyContainer('Free Trial 30 Days','30 Load Postings \n30 Truck Posts \n5 Buy-Sell Posts \n2 Career Posts','0','assets/images/30day.png'),
        BuyContainer('Bronze Plan','100 Load Postings \n100 Truck Posts \n10 Buy-Sell Posts \n5 Career Posts','35','assets/images/bronze.png'),
        BuyContainer('Silver Plan','300 Load Postings \n300 Truck Posts \n30 Buy-Sell Posts \n20 Career Posts','35','assets/images/silver.png'),
        BuyContainer('Gold Plan','600 Load Postings \n600 Truck Posts \n100 Buy-Sell Posts \n60 Career Posts','75','assets/images/gold.png'),
      ]),
    );
  }
}
