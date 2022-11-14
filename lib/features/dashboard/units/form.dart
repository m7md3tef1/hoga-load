part of'../view.dart';

class FormView extends StatelessWidget {
  FormView({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileStates>(
        builder: (context, state) {
          firstnameController.text =
              UpdateProfileCubit.get(context).profileData.firstName ?? '';

          lastnameController.text =
              UpdateProfileCubit.get(context).profileData.lastName ?? '';
          emailController.text =
              UpdateProfileCubit.get(context).profileData.email ?? '';
          phoneController.text =
              UpdateProfileCubit.get(context).profileData.contactNumber ?? '';
          usernameController.text =
              UpdateProfileCubit.get(context).profileData.username ?? '';
          addressController.text =
              UpdateProfileCubit.get(context).profileData.address ?? '';
          return state is GetUserProfileLoading
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                      child: CircularProgressIndicator(
                    color: Colors.orange,
                  )),
                )
              : CustomCard(
                  widget: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 12.sp, vertical: 15.sp),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: firstnameController,
                            validate: Validator.validateName,
                          ),
                          CustomTextField(
                            controller: lastnameController,
                            validate: Validator.validateName,
                          ),
                          CustomTextField(
                            controller: emailController,
                            validate: Validator.validateEmail,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          CustomTextField(
                            controller: phoneController,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'Enter Phone';
                              }
                            },
                            keyboardType: TextInputType.phone,
                          ),
                          CustomTextField(
                            controller: usernameController,
                          ),
                          CustomTextField(
                            height: 180.h,
                            lines: 6,
                            validate: Validator.validateAddress,
                            controller: addressController,
                            keyboardType: TextInputType.streetAddress,
                          ),
                          if (state is UpdateLoading)
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 17, bottom: 27),
                              child: const Center(
                                child: CircularProgressIndicator(
                                    color: ColorManager.primaryColor),
                              ),
                            )
                          else
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 17, bottom: 27),
                              child: CustomButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    UpdateProfileCubit.get(context)
                                        .updateProfile(
                                      UpdateProfile(
                                        firstName:
                                            firstnameController.text.trim(),
                                        lastName:
                                            lastnameController.text.trim(),
                                        username:
                                            usernameController.text.trim(),
                                        phone: phoneController.text.trim(),
                                        email: emailController.text.trim(),
                                        address: addressController.text.trim(),
                                      ),
                                    );
                                    print(CacheHelper.getString(
                                        SharedKeys.token));
                                  }
                                },
                                text: 'Update Profile',
                                color: ColorManager.secondaryColor,
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
