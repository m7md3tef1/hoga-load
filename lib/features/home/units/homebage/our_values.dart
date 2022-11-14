import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/widgets/custom_text.dart';
import '../../../about/units/value_container.dart';


class Values extends StatelessWidget {
  const Values({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(children:[
        Padding(
          padding: EdgeInsets.only(top: 38.h),
          child: CustomText(
            text: 'OUR VALUES',
            fontSize: 14.sp,
            color: const Color(0xFFFDC52F),
            fontWeight: FontWeight.w700,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.h, bottom: 22.h),
          child: CustomText(
            align: TextAlign.center,
            text: 'OUR APPROACH TO MAKE YOUR LOGISTICS EASY',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        ValueContainer(image: 'assets/images/Rectangle 9.png',title: 'Post Loads and Vehicles',desc:
            'User can post loads and vehicles from one location to another and contact other users directly.',
            ),
        ValueContainer(image: 'assets/images/Rectangle 9 (1).png',title: 'List items for Sale & Purchase',
        desc: 'Different items related to logistics can be posted with it\'s details for sale or purchase.',

        ),
        ValueContainer(image: 'assets/images/Rectangle 9 (2).png',title: 'Publish your Job Openings',
        desc: 'All available jobs can be published with specific role and designation.',

        ),




      ]),
    );
  }
}


