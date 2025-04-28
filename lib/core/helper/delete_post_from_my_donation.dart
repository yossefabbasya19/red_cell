import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/core/constant.dart';
import 'package:red_cell/core/remote_storage/get_specific_user_field.dart';

Future<void> deletePostFromMyDonations(
  BuildContext context,
  DonationDetailsDm donationDetailsDm,
    String userId
) async {
  List<dynamic> userDonation = [];
  userDonation = await getSpecificUserField(userId);
  userDonation.remove(donationDetailsDm.docID);
  userDonation = userDonation.toSet().toList();
  FirebaseFirestore.instance
      .collection(fireStoreUsers)
      .doc(userId)
      .update({
    "myDonation": userDonation,
      });
}
