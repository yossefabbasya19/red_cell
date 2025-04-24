import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:red_cell/core/constant.dart';

Future<List<dynamic>> getSpecificUser(String userID) async {
  DocumentSnapshot specificUser =
      await FirebaseFirestore.instance
          .collection(fireStoreUsers)
          .doc(userID)
          .get();
  Map<String, dynamic> user = specificUser.data() as Map<String, dynamic>;
    return user["myDonation"];
}
