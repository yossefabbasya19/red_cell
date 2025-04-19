import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:red_cell/views/authentication/signup/cubit/select_gender_cubit/select_gender_cubit.dart';
import 'package:red_cell/views/authentication/signup/cubit/sign_up/sign_up_cubit.dart';

void signUp(
  BuildContext context,
  UserInfoDm userInfoDm,
  GlobalKey<FormState> formKey,
) {
  if (formKey.currentState!.validate()) {
    formKey.currentState!.save();
    userInfoDm.country = userInfoDm.country ?? "cairo";
    userInfoDm.birthdayDate = userInfoDm.birthdayDate ?? "1960-1-1";
    userInfoDm.isFemale = !BlocProvider.of<SelectGenderCubit>(context).isFemale;
    BlocProvider.of<SignUpCubit>(
      context,
    ).storeDataWithValidation(context, userInfoDm);
  }
}
