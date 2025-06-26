import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:red_cell/core/constant.dart';
import 'package:red_cell/core/helper/show_snack_bar.dart';
import 'package:red_cell/core/remote_storage/get_specific_user.dart';

abstract class FirebaseAuthentication {
  static CollectionReference users = FirebaseFirestore.instance.collection(
    fireStoreUsers,
  );
  static late UserCredential credential;

  static Future<bool> checkEmailAlreadyInUse(
    BuildContext context,
    String email,
  ) async {
    QuerySnapshot getAllUsers = await users.get();
    for (int i = 0; i < getAllUsers.docs.length; i++) {
      Map<String, dynamic> userDataInMap =
          getAllUsers.docs[i].data() as Map<String, dynamic>;
      if (email == userDataInMap[fireStoreUsersUid]) {
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
    String phoneNumber,
  ) async {
    QuerySnapshot getAllUsers = await users.get();
    for (int i = 0; i < getAllUsers.docs.length; i++) {
      Map<String, dynamic> userDataInMap =
          getAllUsers.docs[i].data() as Map<String, dynamic>;
      if (phoneNumber == userDataInMap['phoneNumber']) {
        showSnackBar(context, "phoneNumber is already used");
        return false;
      }
    }
    return true;
  }

  static Future<void> createEmailAndPassword(UserInfoDm userInfoDM) async {
    credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: userInfoDM.emailAddress!,
      password: userInfoDM.password!,
    );
    addUserinfo(userInfoDM, credential);
    final user = FirebaseAuth.instance.currentUser;
    UserInfoDm.userInfoDm = await getSpecificUser(user!.uid);
    await user.sendEmailVerification();
  }

  static Future<void> login(String emailAddress, String password) async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);
    UserInfoDm.userInfoDm = await getSpecificUser(user.user!.uid);
  }

  static Future<void> addUserinfo(
    UserInfoDm userInfoDm,
    UserCredential userCredential,
  ) async {
    try {
      return await users
          .doc(userCredential.user!.uid)
          .set({
            fireStoreUsersUid: userInfoDm.emailAddress,
            fireStoreUsersUserName: userInfoDm.userName,
            //fireStoreUsersPassword: userInfoDm.password,
            fireStoreUsersPhoneNumber: userInfoDm.phoneNumber,
            fireStoreUsersBirthDate: userInfoDm.birthdayDate,
            fireStoreUsersCountry: userInfoDm.country,
            fireStoreUsersGender: userInfoDm.isFemale,
            fireStoreUsersProfileImage: '',
            'myDonation': [],
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<UserInfoDm> getSpecificUser(String userID) async {
    DocumentSnapshot specificUser =
        await FirebaseFirestore.instance
            .collection(fireStoreUsers)
            .doc(userID)
            .get();
    Map<String, dynamic> user = specificUser.data() as Map<String, dynamic>;
    return UserInfoDm.fromJson(user, specificUser.id);
  }

  static Future<void> editProfile(UserInfoDm userInfo) async {
    await FirebaseFirestore.instance
        .collection(fireStoreUsers)
        .doc(userInfo.docId)
        .set(userInfo.toJson());
  }

  static Future<void> forgetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
