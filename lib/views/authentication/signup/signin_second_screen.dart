import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/constant.dart';
import 'package:red_cell/core/helper/show_snack_bar.dart';
import 'package:red_cell/core/helper/text_form_field_validation_function.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';
import 'package:red_cell/core/widgets/custom_drob_down_button.dart';
import 'package:red_cell/core/widgets/custom_eleveted_button.dart';
import 'package:red_cell/views/authentication/signup/cubit/select_gender_cubit/select_gender_cubit.dart';
import 'package:red_cell/views/authentication/signup/cubit/sign_up/sign_up_cubit.dart';
import 'package:red_cell/views/authentication/signup/sign_up_buttom_function/sign_up_button_function.dart';
import 'package:red_cell/views/authentication/widgets/custom_status.dart';
import 'package:red_cell/views/authentication/widgets/custom_text_form_field.dart';
import 'package:red_cell/views/authentication/widgets/date_time_picker.dart';
import 'package:red_cell/views/authentication/widgets/gender_user_input_field.dart';

class SignInSecondScreen extends StatefulWidget {
  const SignInSecondScreen({super.key});

  @override
  State<SignInSecondScreen> createState() => _SignInSecondScreenState();
}

class _SignInSecondScreenState extends State<SignInSecondScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    UserInfoDm userInfoDm =
        ModalRoute.of(context)!.settings.arguments as UserInfoDm;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: BlocProvider(
            create: (context) => SignUpCubit(),
            child: Padding(
              padding: EdgeInsets.only(top: 16, right: 16, left: 16),
              child: Form(
                key: formKey,
                child: BlocProvider(
                  create: (context) => SelectGenderCubit(),
                  child: Builder(
                    builder: (context) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomStatus(titleOne: "Sign In", titleTwo: "2/3"),
                          SizedBox(height: 24),
                          CustomDropDownButton(
                            label: "choose your country",
                            Items: egyptGovernorates,
                            onSelect: (value) {
                              userInfoDm.country = value;
                            },
                          ),
                          CustomTextFormField(
                            myKeyboardType: TextInputType.phone,
                            hintText: "phone Number",
                            isPassword: false,
                            onSaved: (value) {
                              userInfoDm.phoneNumber = value;
                            },
                            validation: phoneValidation,
                          ),
                          GenderUserInputField(),
                          SizedBox(height: 16),
                          Text(
                            "Birth Date",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          MyDateTimePicker(
                            onDateTimeChanged: (DateTime newDateTime) {
                              userInfoDm.birthdayDate = formatDate(
                                newDateTime,
                                dateFormatSignIn,
                              );
                            },
                          ),
                          SizedBox(height: 24),
                          BlocConsumer<SignUpCubit, SignUpState>(
                            listener: (context, state) {
                              if(state is SignUpFailure){
                                showSnackBar(context,state.errMassage);
                              }else if(state is SignUpSuccess){
                                showSnackBar(context,"registration success ");
                                Navigator.pushReplacementNamed(context, MyRoutes.login);
                              }
                            },
                            builder: (context, state) {
                              return CustomElevatedButton(
                                widget:
                                    state is SignUpLoading
                                        ? CircularProgressIndicator(
                                          color: ColorsManeger.white,
                                        )
                                        : Text(
                                          'Continue',
                                          style:
                                              Theme.of(
                                                context,
                                              ).textTheme.labelMedium,
                                        ),
                                onPressed:(){
                                  signUp(context, userInfoDm, formKey);
                                } ,
                              );
                            },
                          ),
                          SizedBox(height: 24),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
