part of '../view.dart';

class FormView extends StatelessWidget {
  FormView({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController? firstnameController = TextEditingController();
  TextEditingController? lastnameController = TextEditingController();
  TextEditingController? usernameController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? addressController = TextEditingController();
  TextEditingController? phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileStates>(
        builder: (context, state) {
          return CustomCard(
            widget: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 15.sp),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: UpdateProfileCubit.get(context).profileList!.toString(),
                      controller: firstnameController,
                      validate: Validator.validateName,
                    ),
                    CustomTextField(
                      hintText: 'Sign',
                      controller: lastnameController,
                      validate: Validator.validateName,
                    ),
                    CustomTextField(
                      hintText: 'Satinder.singh67097@gmail.com',
                      controller: emailController,
                      validate: Validator.validateEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    CustomTextField(
                      hintText: '0304994933',
                      controller: phoneController,
                      validate: (value){
                        if (value.isEmpty) {
                          return 'Enter Phone';
                        }
                      },
                      keyboardType: TextInputType.phone,

                    ),
                    CustomTextField(
                      hintText: 'Satinder.singh67097',
                      controller: usernameController,
                      validate: Validator.validateName,
                    ),
                    CustomTextField(
                      height: 180.h,
                      lines: 6,
                      hintText: 'dsjfnsljdfns',
                      validate: Validator.validateAddress,
                      controller: addressController,
                      keyboardType: TextInputType.streetAddress,
                    ),
                    if (state is UpdateLoading)
                      const Center(
                        child: CircularProgressIndicator(
                            color: ColorManager.primaryColor),
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.only(top: 17, bottom: 27),
                        child: CustomButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              UpdateProfileCubit.get(context).updateProfile(
                                UpdateProfile(
                                  firstName: firstnameController!.text.trim(),
                                  lastName: lastnameController!.text.trim(),
                                  username: usernameController!.text.trim(),
                                  phone: phoneController!.text.trim(),
                                  email: emailController!.text.trim(),
                                  address: addressController!.text.trim(),
                                ),
                              );
                              print(CacheHelper.getString(SharedKeys.token));
                            }
                          },
                          text: 'Update Profile',
                          color: ColorManager.yellow,
                        ),
                      )
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
