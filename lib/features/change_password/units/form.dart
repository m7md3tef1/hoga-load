part of '../view.dart';

class Form extends StatelessWidget {
  const Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 540.h,
      width: 345.w,
      decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: CustomText(
                  text: 'CHANGE PASSWORD',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              )),
            ],
          ),
          SizedBox(
              width: 322.w,
              child: const Divider(
                thickness: 1,
              )),
          SizedBox(
            height: 43.h,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 6.h),
            child: CustomTextField(
              color: Colors.grey[400],
              hintText: 'Enter your current password',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 6.h),
            child: CustomTextField(
              color: Colors.grey[400],
              hintText: 'Enter your new password',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 6.h),
            child: CustomTextField(
              color: Colors.grey[400],
              hintText: 'Enter again to confirm the password.',
            ),
          ),
          CustomButton(
              text: 'CHANGE PASSWORD',
              colortext: Colors.white,
              color: ColorManager.primaryColor),
          Padding(
            padding: EdgeInsets.only(left: 11.w, right: 14.w, top: 17.h),
            child: CustomText(
              color: const Color(0xFF666666),
              align: TextAlign.start,
              text:
                  '* Please enter a strong password, a strong password contains at least one special character, one capital letter and a digit.',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 11.w, right: 14.w, top: 17.h),
            child: CustomText(
              color: const Color(0xFF666666),
              align: TextAlign.start,
              text:
                  '** Do not share your account details or password with anyone else. Our executive never asks for your sensitive details like passwords.',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
