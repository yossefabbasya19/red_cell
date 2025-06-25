import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/helper/show_snack_bar.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';
import 'package:red_cell/core/widgets/custom_eleveted_button.dart';
import 'package:red_cell/core/widgets/custom_text_button_with_text.dart';
import 'package:red_cell/views/authentication/presentation/view_model/auth_view_model_cubit.dart';
import 'package:red_cell/views/authentication/presentation/views/widgets/custom_status.dart';
import 'package:red_cell/views/authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:red_cell/views/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:red_cell/views/authentication/presentation/views/widgets/social_sign.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                  CustomStatus(
                    titleOne: AppLocalizations.of(context)!.login,
                    titleTwo: "",
                  ),
                  SizedBox(height: 24),
                  SocialSign(),
                  CustomTextFormField(
                    myKeyboardType: TextInputType.emailAddress,
                    hintText: AppLocalizations.of(context)!.email_address,
                    isPassword: false,
                    onSaved: (value) {
                      emailAddress = value!;
                    },
                  ),
                  CustomTextFormField(
                    hintText: AppLocalizations.of(context)!.password,
                    isPassword: true,
                    onSaved: (value) {
                      password = value!;
                    },
                  ),
                  CustomTextButton(),
                  SizedBox(height: 16),
                  BlocConsumer<AuthViewModelCubit, AuthViewModelState>(
                    listener: (context, state) {
                      if (state is LogInFailure) {
                        showSnackBar(context, state.errMassage);
                      } else if (state is LogInSuccess) {
                        Navigator.pushReplacementNamed(
                          context,
                          MyRoutes.mainLayout,
                          //arguments: state.userInfoDm,
                        );

                      }
                    },
                    builder: (context, state) {
                      return CustomElevatedButton(
                        onPressed: () {
                          formKey.currentState!.save();
                          BlocProvider.of<AuthViewModelCubit>(
                            context,
                          ).logIn( emailAddress!, password!);
                        },
                        widget:
                            state is LogInLoading
                                ? CircularProgressIndicator(
                                  color: ColorsManeger.white,
                                )
                                : Text(
                              AppLocalizations.of(context)!.continue_txt,
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                      );
                    },
                  ),
                  CustomTextButtonWithText(
                    descriptionText: AppLocalizations.of(context)!.do_not_have_an_account,
                    buttonText: AppLocalizations.of(context)!.sign_up,
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
