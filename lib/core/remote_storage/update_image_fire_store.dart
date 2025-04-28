import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:red_cell/core/constant.dart';

Future<void> updateImage(
    String userID,
    String imagePath
    ) async {
  FirebaseFirestore.instance.collection(fireStoreUsers).doc(userID).update({
    fireStoreUsersProfileImage: imagePath,
  });
}