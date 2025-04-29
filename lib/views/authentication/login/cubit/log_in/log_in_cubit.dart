import "package:bloc/bloc.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:red_cell/core/helper/show_snack_bar.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());
  void logIn(BuildContext context, String emailAddress, String password) async {
    emit(LogInLoading());
    try {
       await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      emit(LogInSuccess(/*userInfoDm: userInfoDm*/));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'Wrong password provided for that user.');
      }
      emit(LogInFailure(errMassage: e.code.toString()));
    }
  }
}
