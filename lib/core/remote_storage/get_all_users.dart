import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:red_cell/core/constant.dart';

Future<List<UserInfoDm>> getAllUsers()async{
   CollectionReference users = FirebaseFirestore.instance.collection(
    fireStoreUsers,
  );
   List<UserInfoDm> allUsersInDm = [];
   QuerySnapshot getAllUsers = await users.get();
   for(int i = 0 ; i<getAllUsers.docs.length;i++){
     Map<String, dynamic> userDataInMap =
     getAllUsers.docs[i].data() as Map<String, dynamic>;
     allUsersInDm.add(UserInfoDm.fromJson(userDataInMap, getAllUsers.docs[i].id));
   }
   return allUsersInDm;
}