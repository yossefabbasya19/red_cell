import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:red_cell/core/assets_maneger/assets_maneger.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/helper/show_snack_bar.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:red_cell/core/widgets/custom_eleveted_button.dart';
import 'package:red_cell/views/authentication/signup/firebase_authentication/firebase_authentication.dart';
import 'package:red_cell/views/authentication/presentation/views/widgets/custom_text_form_field.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String? email;
  bool isLoad = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.forget_password), centerTitle: true),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Image(image: AssetImage(AssetsManeger.forgetPassword)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomTextFormField(
                  hintText: AppLocalizations.of(context)!.email_address,
                  isPassword: false,
                  onSaved: (value) {
                    email = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: CustomElevatedButton(
                  onPressed: () async {
                    formKey.currentState!.save();
                    setState(() {
                      isLoad = true;
                    });
                    if (!await FirebaseAuthentication.checkEmailAlreadyInUse(
                      context,
                      email!,
                    )) {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                        email: email!,
                      );
                      showSnackBar(
                        context,
                        "check your email verify email sent",
                      );
                      setState(() {
                        isLoad = false;
                      });
                      Navigator.pushReplacementNamed(context,MyRoutes.login);
                    } else {
                      showSnackBar(context, "email not founded");
                    }
                  },
                  widget:
                      isLoad
                          ? CircularProgressIndicator(
                            color: ColorsManeger.white,
                          )
                          : Text(
                            AppLocalizations.of(context)!.verify_email,
                            style: TextStyle(
                              color: ColorsManeger.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
