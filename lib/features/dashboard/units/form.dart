part of '../view.dart';

class FormView extends StatelessWidget {
   FormView({Key? key}) : super(key: key);
GlobalKey<FormState>formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return
      CustomCard(
        widget: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 12.sp,vertical: 15.sp),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                  hintText: 'Satinder',
                ),
                CustomTextField(
                  hintText: 'Sign',
                ),
                CustomTextField(
                  hintText: 'Satinder.singh67097@gmail.com',

                ),
                CustomTextField(
                  hintText: '0304994933',

                ),
                CustomTextField(
                  hintText: 'Satinder.singh67097',

                ),
                CustomTextField(
                  height:180.h,
                  lines: 6,
                  hintText: 'dsjfnsljdfns',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 17,bottom: 27),
                  child: CustomButton(
                    text: 'Update Profile', color: ColorManager.orange,

                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}
