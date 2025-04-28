import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/helper/show_snack_bar.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';
import 'package:red_cell/core/widgets/custom_eleveted_button.dart';
import 'package:red_cell/core/widgets/custom_text_button_with_text.dart';
import 'package:red_cell/views/authentication/login/cubit/log_in/log_in_cubit.dart';
import 'package:red_cell/views/authentication/widgets/custom_status.dart';
import 'package:red_cell/views/authentication/widgets/custom_text_form_field.dart';
import 'package:red_cell/views/authentication/widgets/social_sign.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? emailAddress;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16, right: 16, left: 16),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomStatus(titleOne: "Log in", titleTwo: ""),
                  SizedBox(height: 24),
                  SocialSign(),
                  CustomTextFormField(
                    myKeyboardType: TextInputType.emailAddress,
                    hintText: "Email",
                    isPassword: false,
                    onSaved: (value) {
                      emailAddress = value!;
                    },
                  ),
                  CustomTextFormField(
                    hintText: "password",
                    isPassword: true,
                    onSaved: (value) {
                      password = value!;
                    },
                  ),
                  SizedBox(height: 24),
                  BlocConsumer<LogInCubit, LogInState>(
                    listener: (context, state) {
                      if (state is LogInFailure) {
                        showSnackBar(context, state.errMassage);
                      } else if (state is LogInSuccess) {
                        Navigator.pushReplacementNamed(
                          context,
                          MyRoutes.mainLayout,
                          //arguments: state.userInfoDm,
                        );
                        /*if (!state.credential.user!.emailVerified) {
                          showSnackBar(
                            context,
                            "check your email and Verify Email ",
                          );
                        } else {
                          Navigator.pushNamed(context, MyRoutes.mainLayout);
                        }*/
                      }
                    },
                    builder: (context, state) {
                      return CustomElevatedButton(
                        onPressed: () {
                          formKey.currentState!.save();
                          BlocProvider.of<LogInCubit>(
                            context,
                          ).logIn(context, emailAddress!, password!);
                        },
                        widget:
                            state is LogInLoading
                                ? CircularProgressIndicator(
                                  color: ColorsManeger.white,
                                )
                                : Text(
                                  "Confirm",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                      );
                    },
                  ),
                  CustomTextButtonWithText(
                    descriptionText: "Don't have an account?",
                    buttonText: "  Sign up",
                    onPressed: () {

                      Navigator.pushReplacementNamed(
                        context,
                        MyRoutes.signupFirstScreen,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
