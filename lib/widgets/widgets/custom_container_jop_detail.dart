import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/core/data/models/jobs/get_jop.dart';
import 'package:hoga_load/core/widgets/custom_card.dart';
import 'package:hoga_load/widgets/widgets/custom_text.dart';


class CustomContainerJop extends StatelessWidget {
  final GetJop jop;
  const CustomContainerJop(this.jop, {Key? key}) : super(key: key);

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
            padding: EdgeInsets.only(left: 12.w, top: 25.h, bottom: 25.h),
            child: Row(
              children: [
                CustomText(
                  text: jop.title == null ? 'other' : jop.title.toString(),
                  fontSize: 18.sp,
                  align: TextAlign.start,
                  fontWeight: FontWeight.w600,
                  color: ColorManager.primaryColor,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8),
            child: Row(
              //  mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.person_outline,
                      color: ColorManager.primaryColor,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    CustomText(
                      text: jop.user == null
                          ? 'other'
                          : jop.user!.username.toString(),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.access_time_outlined,
                        color: ColorManager.primaryColor,
                      ),
                      Expanded(
                        child: CustomText(
                          align: TextAlign.start,
                          text: 'createdAt ',
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
                    // mainAxisAlignment: MainAxisAlignment.start,
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
                          text:
                              '${jop.category?.title} → ${jop.jobType!.title}' ??
                                  'other',
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
          if(jop.description !=null)
          Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8, top: 8),
              child: CustomText(
                text: jop.description,
                color: Colors.black45,
                fontWeight: FontWeight.w500,
                align: TextAlign.start,
                fontSize: 16.sp,
              )),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              height: 7.h,
              width: 1.sw,
              child: const Divider(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 33.w, bottom: 15.h, top: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(text: 'CONTACT DETAILS'),
                    ],
                  ),
                ),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Row(
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          color: ColorManager.primaryColor,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        CustomText(
                          text: jop.user == null
                              ? 'other'
                              : jop.user!.email.toString(),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                      ],
                  ),
                    ),
                    
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
                          text: jop.user == null
                              ? 'other'
                              : jop.user!.contactNumber.toString(),
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
