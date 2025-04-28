import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:red_cell/core/constant.dart';

Future<UserInfoDm> getSpecificUser(String userID) async {
  try{
    DocumentSnapshot specificUser =
        await FirebaseFirestore.instance
            .collection(fireStoreUsers)
            .doc(userID)
            .get();
    Map<String, dynamic> user = specificUser.data() as Map<String, dynamic>;
    return UserInfoDm.fromJson(user, specificUser.id);
  }on FirebaseException catch(e){
    throw Exception(e);
  }catch(e){
    throw Exception(e);
  }
}