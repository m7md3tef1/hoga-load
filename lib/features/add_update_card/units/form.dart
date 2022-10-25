part of '../view.dart';

class Form extends StatelessWidget {
  const Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      widget: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: CustomText(
                  text: 'ENTER CARD INFORMATION',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 9.h, bottom: 14.h),
                child: CustomText(
                  text: 'Add a Payment Method',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              )),
            ],
          ),
          SizedBox(
            width: 322.w,
            child: const Divider(
              thickness: 1,
            ),
          ),
          CustomTextField(
            hintText: '4242-4242-4242-4242',
            color: ColorManager.darkGrey,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 14.w),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 55.h,
                    width: 155.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: ColorManager.greyColor)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 14.0.w, bottom: 0.h),
                          child: TextFormField(
                              autofocus: false,
                              textDirection: TextDirection.ltr,
                              decoration: InputDecoration(
                                hintText: 'March',
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: ColorManager.darkGrey,
                                ),
                                border: InputBorder.none,
                                focusColor: ColorManager.blackColor,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 14.w,
                ),
                Expanded(
                  child: Container(
                    height: 55.h,
                    width: 155.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: ColorManager.greyColor)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 14.0.w, bottom: 0.h),
                          child: TextFormField(
                              autofocus: false,
                              textDirection: TextDirection.ltr,
                              decoration: InputDecoration(
                                hintText: '2026',
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: ColorManager.darkGrey,
                                ),
                                border: InputBorder.none,
                                focusColor: ColorManager.blackColor,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 14.w),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 55.h,
                    width: 155.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: ColorManager.greyColor)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 14.0.w, bottom: 0.h),
                          child: TextFormField(
                              autofocus: false,
                              textDirection: TextDirection.ltr,
                              decoration: InputDecoration(
                                hintText: 'CVV',
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: ColorManager.darkGrey,
                                ),
                                border: InputBorder.none,
                                focusColor: ColorManager.blackColor,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/Credit_Card_01.svg',
                        color: const Color(0xFF3D3D3D),
                      ),
                      Container(
                        height: 24.h,
                        width: 114.w,
                        child: CustomText(
                          color: const Color(0xFF3D3D3D),
                          align: TextAlign.start,
                          text: '3 digits can be found onthe signature strip.',
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          CustomTextField(
            hintText: 'Satinder Singh',
            color: ColorManager.darkGrey,
          ),
          CustomTextField(
            hintText: 'Satinder.singh67097@gmail.com',
            color: ColorManager.darkGrey,
          ),
          CustomTextField(
            hintText: '0304994933',
            color: ColorManager.darkGrey,
          ),
          CustomTextField(
            hintText: 'asdna,md',
            color: ColorManager.darkGrey,
          ),
          CustomTextField(
            hintText: 'asjdnamndsa',
            color: ColorManager.darkGrey,
          ),
          CustomTextField(
            hintText: 'British Columbia',
            color: ColorManager.darkGrey,
          ),
          CustomTextField(
            hintText: 'Vancouver',
            color: ColorManager.darkGrey,
          ),
          CustomTextField(
            hintText: 'V43 E3R',
            color: ColorManager.darkGrey,
          ),
          Padding(
            padding: EdgeInsets.only(left: 11.w, right: 14.w, top: 17.h),
            child: CustomText(
              color: const Color(0xFF666666),
              align: TextAlign.center,
              text:
                  'We do NOT store your card details, it will be used as your payment method for subscription.',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          CustomButton(
              text: 'PROCEED',
              colortext: Colors.white,
              font: 15.sp,

              color: ColorManager.primaryColor),
          SizedBox(
            height: 14.h,
          ),
          CustomButton(
              text: 'REMOVE THIS PAYMENT METHOD',
              colortext: Colors.white,
              font: 14.sp,
              color: const Color(0xFFDC3545)),
          SizedBox(
            height: 18.h,
          ),
          SizedBox(
            width: 322.h,
            child: Divider(
              thickness: 1,
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Row(
                  children: [
                    CustomText(
                      text: 'Skip',
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF0D6EFD),
                    ),
                    const Icon(Icons.keyboard_double_arrow_right_outlined,color: Color(0xFF0D6EFD),),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 22.h,
          ),

        ],
      ),
    );
  }
}
