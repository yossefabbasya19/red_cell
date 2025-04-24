import "package:bloc/bloc.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:red_cell/core/constant.dart';
import 'package:red_cell/core/helper/show_snack_bar.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());
  CollectionReference users = FirebaseFirestore.instance.collection(
    fireStoreUsers,
  );
  UserInfoDm userInfoDm = UserInfoDm();

  void logIn(BuildContext context, String emailAddress, String password) async {
    emit(LogInLoading());
    try {
       await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      QuerySnapshot getUsers = await users.get();
      for (int i = 0; i < getUsers.docs.length; i++) {
        Map<String, dynamic> userInMap =
            getUsers.docs[i].data() as Map<String, dynamic>;
        if (userInMap[fireStoreUsersUid] == emailAddress) {
          userInfoDm = UserInfoDm.fromJson(userInMap, getUsers.docs[i].id);
        }
      }
      emit(LogInSuccess(userInfoDm: userInfoDm));
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
