import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:red_cell/core/constant.dart';

void updateDonationState(String specificDonationID) {
  FirebaseFirestore.instance
      .collection(fireStoreDonationRequests)
      .doc(specificDonationID)
      .update({fireStoreDonationRequestsProgressState: true});
}
