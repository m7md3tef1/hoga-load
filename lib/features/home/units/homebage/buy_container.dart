import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';

import '../../../../core/color_manager/color_manager.dart';
import '../../../../core/router/router.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../../add_update_card/view.dart';

class BuyContainer extends StatelessWidget {
  BuyContainer({this.text, this.loadsNo,this.jobsNo,this.productNo,this.vehiclesNo,
  this.price,this.image,super.key});
  String? text;
  int? loadsNo;
    int? vehiclesNo;
    int? jobsNo;
    int? productNo;

String? price;
  String? image;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      bottomPadding: 0,
      widget: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 18.h, bottom: 15.h),
            child: CustomText(
              text: text,
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          Stack(children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: CustomText(
                      text: '\$',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  CustomText(
                    text: price,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w800,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CustomText(
                      text: '/ mo',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFFA9A9A9),
                    ),
                  ),
                ],
              ),
            ),
          ]),
           Image(image: AssetImage(image!)),
          CustomText(
            text: "$loadsNo Load Postings",
            fontSize: 18.sp,
            align: TextAlign.center,
            fontWeight: FontWeight.w700,
          ),
          CustomText(
            text: "$vehiclesNo Truck Posts",
            fontSize: 18.sp,
            align: TextAlign.center,
            fontWeight: FontWeight.w700,
          ),
          CustomText(
            text: "$productNo Buy-Sell Posts",
            fontSize: 18.sp,
            align: TextAlign.center,
            fontWeight: FontWeight.w700,
          ),
          CustomText(
            text:  "$jobsNo Career Posts",
            fontSize: 18.sp,
            align: TextAlign.center,
            fontWeight: FontWeight.w700,
          ),


          InkWell(
            onTap: (){
               MagicRouter.navigateTo(AddUpdateCardView());

            },
            child: Padding(
              padding: EdgeInsets.all(12.r),
              child: Container(
                height: 60.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorManager.primaryColor,
                  ),
                  color: ColorManager.whiteColor,
                  borderRadius: BorderRadius.circular(7.r),
                ),
                child: Center(
                  child: CustomText(
                    text: 'Buy Now',
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.primaryColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
