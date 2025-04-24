import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/core/constant.dart';

Future<DonationDetailsDm> getSpecificPost(String postID) async {
  DocumentSnapshot specificUser =
      await FirebaseFirestore.instance
          .collection(fireStoreDonationRequests)
          .doc(postID)
          .get();
  Map<String, dynamic> post = specificUser.data() as Map<String, dynamic>;
  DonationDetailsDm donationDetailsDm = DonationDetailsDm.fromJson(
    post,
    specificUser.id,
  );
  return donationDetailsDm;
}
