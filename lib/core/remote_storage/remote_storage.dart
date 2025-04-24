import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/core/constant.dart';

class RemoteStorage {
  CollectionReference requests = FirebaseFirestore.instance.collection(
    fireStoreDonationRequests,
  );

  void addDonationRequest(Map<String, dynamic> donationRequestDate) async {
    requests.add(donationRequestDate);
  }

  Future<List<DonationDetailsDm>> getDonationRequest() async {

    List<DonationDetailsDm> donationRequests = [];
    QuerySnapshot allRequests =
        await requests
            .orderBy(fireStoreDonationRequestsCreateAt, descending: true)
            .get();
    List<QueryDocumentSnapshot> allDocs = allRequests.docs;
    for (int i = 0; i < allDocs.length; i++) {
      Map<String, dynamic> doc = allDocs[i].data() as Map<String, dynamic>;
      donationRequests.add(DonationDetailsDm.fromJson(doc, allDocs[i].id));
    }
    return donationRequests;
  }
}
