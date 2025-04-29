import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:red_cell/core/assets_maneger/assets_maneger.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/helper/show_snack_bar.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';
import 'package:red_cell/core/remote_storage/remote_storage.dart';
import 'package:red_cell/core/widgets/custom_eleveted_button.dart';
import 'package:red_cell/views/authentication/signup/firebase_authentication/firebase_authentication.dart';
import 'package:red_cell/views/authentication/widgets/custom_text_form_field.dart';

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
      appBar: AppBar(title: Text("Forget Password"), centerTitle: true),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Image(image: AssetImage(AssetsManeger.forgetPassword)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomTextFormField(
                  hintText: "Email",
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
                            "Verify Email",
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
