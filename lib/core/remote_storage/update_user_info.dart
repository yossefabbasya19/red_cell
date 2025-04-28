import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:red_cell/core/constant.dart';

Future<void> updateUserInfo(
  String userID,
  UserInfoDm userInfoDm
) async {
  FirebaseFirestore.instance.collection(fireStoreUsers).doc(userID).update({
    fireStoreUsersUserName: userInfoDm.userName,
    fireStoreUsersUid:userInfoDm.emailAddress,
    fireStoreUsersPhoneNumber:userInfoDm.phoneNumber
  });
}
