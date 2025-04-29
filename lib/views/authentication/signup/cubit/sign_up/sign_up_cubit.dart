import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:red_cell/core/helper/show_snack_bar.dart';
import 'package:red_cell/views/authentication/signup/firebase_authentication/firebase_authentication.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<bool> storeDataWithValidation(
    BuildContext context,
    UserInfoDm userInfoDm,
  ) async {
    emit(SignUpLoading());
    try {
      if (!await FirebaseAuthentication.checkPhoneNumberAlreadyInUse(
        context,
        userInfoDm.phoneNumber!,
      )) {
        emit(SignUpInitial());
        return false;
      }
      if (!await FirebaseAuthentication.checkEmailAlreadyInUse(
        context,
        userInfoDm.emailAddress!,
      )) {
        showSnackBar(context, "email is already used");
         emit(SignUpInitial());
        return false;
      }
      FirebaseAuthentication.createEmailAndPassword(context, userInfoDm);
      emit(SignUpSuccess());
      return true;
    } catch (e) {
      emit(SignUpFailure(errMassage: e.toString()));
      return false;
    }
  }
}
