import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:red_cell/core/constant.dart';
import 'package:red_cell/core/helper/show_snack_bar.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';

abstract class FirebaseAuthentication {
  static CollectionReference users = FirebaseFirestore.instance.collection(
    fireStoreUsers,
  );

  static Future<bool> checkEmailAlreadyInUse(
    BuildContext context,
    UserInfoDm userInfoDm,
  ) async {
    QuerySnapshot getAllUsers = await users.get();
    for (int i = 0; i < getAllUsers.docs.length; i++) {
      Map<String, dynamic> userDataInMap =
          getAllUsers.docs[i].data() as Map<String, dynamic>;
      if (userInfoDm.emailAddress == userDataInMap[fireStoreUsersUid]) {
        showSnackBar(context, "email is already used");
        return false;
      }
    }
    /*Navigator.pushNamed(
      context,
      MyRoutes.signupSecondScreen,
      arguments: userInfoDm,
    );*/
    return true;
  }

  static Future<bool> checkPhoneNumberAlreadyInUse(
    BuildContext context,
    UserInfoDm userInfoDm,
  ) async {
    QuerySnapshot getAllUsers = await users.get();
    for (int i = 0; i < getAllUsers.docs.length; i++) {
      Map<String, dynamic> userDataInMap =
          getAllUsers.docs[i].data() as Map<String, dynamic>;
      if (userInfoDm.phoneNumber == userDataInMap['phoneNumber']) {
        showSnackBar(context, "phoneNumber is already used");
        return false;
      }
    }
    return true;
  }

  static void createEmailAndPassword(
    BuildContext context,
    UserInfoDm userInfoDM,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userInfoDM.emailAddress!,
        password: userInfoDM.password!,
      );
      final user = FirebaseAuth.instance.currentUser;
      user?.sendEmailVerification()??'';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> addUserinfo(UserInfoDm userInfoDm) async {
    try {
      return await users
          .add({
            fireStoreUsersUid: userInfoDm.emailAddress,
            fireStoreUsersUserName: userInfoDm.userName,
            fireStoreUsersPassword: userInfoDm.password,
            fireStoreUsersPhoneNumber: userInfoDm.phoneNumber,
            fireStoreUsersBirthDate: userInfoDm.birthdayDate,
            fireStoreUsersCountry: userInfoDm.country,
            fireStoreUsersGender: userInfoDm.isFemale,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    } catch (e) {
      throw Exception(e);
    }
  }


}
