import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:red_cell/core/constant.dart';
import 'package:red_cell/core/remote_storage/get_specific_user_field.dart';

Future<void> deletePostFromMyDonations(
  DonationDetailsDm donationDetailsDm,
) async {
  UserInfoDm.userInfoDm!.myDonation!.remove(donationDetailsDm.docID);
  FirebaseFirestore.instance
      .collection(fireStoreUsers)
      .doc(UserInfoDm.userInfoDm!.docId)
      .set(UserInfoDm.userInfoDm!.toJson());
}
