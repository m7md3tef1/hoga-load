import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoga_load/core/color_manager/color_manager.dart';
import 'package:hoga_load/core/router/router.dart';
import 'package:hoga_load/features/auth/units/cant_login.dart';
import 'package:hoga_load/features/auth/units/card_title.dart';
import 'package:hoga_load/features/auth/units/custom_no_account.dart';
import 'package:hoga_load/features/auth/units/customer_text_field.dart';
import 'package:hoga_load/features/auth/units/logo.dart';
import 'package:hoga_load/features/home/view.dart';
import 'package:hoga_load/widgets/widgets/custom_appbar.dart';

import '../../core/widgets/custom_card.dart';
import '../../core/data/models/login_model.dart';
import '../../core/validator/validator.dart';
import '../../widgets/widgets/custom_button.dart';
import '../../widgets/widgets/custom_scaffold.dart';
import 'domain/auth_cubit.dart';
import 'domain/auth_states.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: SingleChildScrollView(
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (BuildContext context, state) {
          if (state is SignInSuccess) {
            MagicRouter.navigateAndReplacement(const Home());
          }
        },
        builder: (context, state) => Column(
          children: [
            CustomAppbar(title: 'Login', hideIcons: true),
            const SizedBox(
              height: 18,
            ),
            CustomCard(
              widget: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Logo(),
                    TitleText(
                      title: 'Login',
                    ),
                    CustomTextFormField(
                      hintText: 'Enter E-mail',
                      controller: emailController,
                      validate: Validator.validateEmail,
                    ),
                    CustomTextFormField(
                      hintText: 'Enter Password',
                      controller: passwordController,
                      validate: Validator.validatePassword,
                      obs: true,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    if (state is SignInLoading)
                      Column(
                        children: [
                          const Center(
                            child: CircularProgressIndicator(
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          )
                        ],
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: CustomButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              AuthCubit.get(context).signIn(LoginModel(
                                  password: passwordController.text.trim(),
                                  userName: emailController.text.trim()));
                            }
                          },
                          text: 'Login',
                          color: ColorManager.yellow,
                        ),
                      ),
                    NoAccount(),
                    NotLogged()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
