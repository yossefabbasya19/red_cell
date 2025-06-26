import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_cell/core/assets_maneger/assets_maneger.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/helper/show_snack_bar.dart';
import 'package:red_cell/core/helper/text_form_field_validation_function.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:red_cell/core/widgets/custom_eleveted_button.dart';
import 'package:red_cell/core/remote_storage/firebase_authentication.dart';
import 'package:red_cell/views/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:red_cell/views/forget_password/presentation/view_model/forget_password_cubit.dart';

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
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.forget_password),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Image(image: AssetImage(AssetsManeger.forgetPassword)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomTextFormField(
                  validation: emailValidation,
                  hintText: AppLocalizations.of(context)!.email_address,
                  isPassword: false,
                  onSaved: (value) {
                    email = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                  listener: (context, state) {
                    if (state is ForgetPasswordFailure) {
                      showSnackBar(context, state.errorMessage);
                    } else if (state is ForgetPasswordSuccess) {
                      showSnackBar(context, "check your Email box");
                      Navigator.pop(context);
                    }
                  },
                  builder: (context, state) {
                    return CustomElevatedButton(
                      onPressed: () async {
                        if (!formKey.currentState!.validate()) return;
                        formKey.currentState!.save();
                        BlocProvider.of<ForgetPasswordCubit>(
                          context,
                        ).forgetPassword(email!);
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
