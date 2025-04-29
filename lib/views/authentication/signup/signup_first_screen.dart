import 'package:flutter/material.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:red_cell/core/helper/text_form_field_validation_function.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';
import 'package:red_cell/core/widgets/custom_eleveted_button.dart';
import 'package:red_cell/core/widgets/custom_text_button_with_text.dart';
import 'package:red_cell/views/authentication/widgets/custom_status.dart';
import 'package:red_cell/views/authentication/widgets/custom_text_form_field.dart';
import 'package:red_cell/views/authentication/widgets/social_sign.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? userName;
  String? emailAddress;
  String? password;
  UserInfoDm userInfoDm = UserInfoDm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomStatus(titleOne: AppLocalizations.of(context)!.sign_up, titleTwo: ""),
                  SizedBox(height: 24),
                  SocialSign(),
                  CustomTextFormField(
                    hintText: AppLocalizations.of(context)!.user_name,
                    isPassword: false,
                    validation: userNameValidation,
                    onSaved: (value) {
                      userInfoDm.userName = value!;
                    },
                  ),
                  CustomTextFormField(
                    myKeyboardType: TextInputType.emailAddress,
                    hintText: AppLocalizations.of(context)!.email_address,
                    isPassword: false,
                    validation: emailValidation,
                    onSaved: (value) {
                      userInfoDm.emailAddress = value!;
                    },
                  ),
                  CustomTextFormField(
                    hintText: AppLocalizations.of(context)!.password,
                    isPassword: true,
                    validation: passwordValidation,
                    onSaved: (value) {
                      userInfoDm.password = value!;
                    },
                  ),
                  SizedBox(height: 24),
                  CustomElevatedButton(
                    widget: Text(AppLocalizations.of(context)!.continue_txt, style: Theme.of(context).textTheme.labelMedium),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        Navigator.pushNamed(
                          context,
                          MyRoutes.signupSecondScreen,
                          arguments: userInfoDm,
                        );
                      }
                    },
                  ),
                  CustomTextButtonWithText(
                    descriptionText: AppLocalizations.of(context)!.already_have_an_account,
                    buttonText: AppLocalizations.of(context)!.login,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, MyRoutes.login);
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
