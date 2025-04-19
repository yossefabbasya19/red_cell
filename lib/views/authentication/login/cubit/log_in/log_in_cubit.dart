import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:red_cell/core/helper/show_snack_bar.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';
import 'package:red_cell/views/authentication/signup/firebase_authentication/firebase_authentication.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());

   void logIn(BuildContext context,String emailAddress,String password)async {
    emit(LogInLoading());
    try {
      UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      emit(LogInSuccess(credential: credential));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        showSnackBar(context,'Wrong password provided for that user.');
      }
      emit(LogInFailure(errMassage: e.code.toString()));
    }
  }
}
