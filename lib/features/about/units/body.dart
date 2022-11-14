part of'../view.dart';
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                align: TextAlign.start,
                text: 'WHO WE ARE',
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFDC52F),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 8.h),
          child: CustomText(
            align: TextAlign.start,
            text:
                'We are Logistics integrators with seamless communication between Load uploaders and carrier owners for their smooth transition of loads.',
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: ColorManager.blackColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w,right: 15.w),
          child: CustomText(
            align: TextAlign.start,
            text:
                'We have been regularly updating system towards building a world class solution of Loads, Vehicles, Market and Jobs for an accessible solution towards communication and transparent upload machanism. Every user is given access to platform for their easy communication towards making logistics better.',
            fontSize: 14.5.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF6C6C6C),
          ),
        ),
        SizedBox(
          height: 22.h,
        ),


      ],
    );
  }
}
