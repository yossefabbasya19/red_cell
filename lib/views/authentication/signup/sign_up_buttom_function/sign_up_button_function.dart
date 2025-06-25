import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:red_cell/views/authentication/presentation/view_model/auth_view_model_cubit.dart';

void signUp(
  BuildContext context,
  UserInfoDm userInfoDm,
  GlobalKey<FormState> formKey,
) {
  if (formKey.currentState!.validate()) {
    formKey.currentState!.save();
    userInfoDm.country = userInfoDm.country ?? "cairo";
    userInfoDm.birthdayDate = userInfoDm.birthdayDate ?? "1960-1-1";
    userInfoDm.isFemale = !BlocProvider.of<AuthViewModelCubit>(context).isFemale;
    BlocProvider.of<AuthViewModelCubit>(
      context,
    ).createAccount(userInfoDm);
  }
}
