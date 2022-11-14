part of'../view.dart';

class form extends StatelessWidget {
  form({Key? key}) : super(key: key);
  TextEditingController? currentPassController = TextEditingController();
  TextEditingController? newPassController = TextEditingController();
  TextEditingController? confirmPassController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePassCubit, ChangePassStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: 1.sw,
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
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 6.h),
                        child: CustomTextField(
                          height: .07.sh,
                          color: Colors.grey[400],
                          hintText: 'Enter your current password',
                          controller: currentPassController,
                          validate: Validator.validatePassword,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 6.h),
                        child: CustomTextField(
                          height: .07.sh,
                          color: Colors.grey[400],
                          hintText: 'Enter your new password',
                          controller: newPassController,
                          validate: Validator.validatePassword,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 6.h),
                        child: CustomTextField(
                          height: .07.sh,
                          color: Colors.grey[400],
                          hintText: 'Enter again to confirm the password.',
                          controller: confirmPassController,
                          validate: Validator.validatePassword,
                        ),
                      ),
                    ],
                  )),
              if (state is ChangeLoading)
                const Center(
                  child: CircularProgressIndicator(
                      color: ColorManager.primaryColor),
                )
              else
                CustomButton(
                    function: () {
                      if (formKey.currentState!.validate()) {
                        ChangePassCubit.get(context).changePass(ChangePassModel(
                          confirmPass: confirmPassController!.text.trim(),
                          currentPass: currentPassController!.text.trim(),
                          newPass: newPassController!.text.trim(),
                        ),

                        );
                        print( CacheHelper.getString(SharedKeys.token));
                      }
                    },
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
      },
    );
  }
}
