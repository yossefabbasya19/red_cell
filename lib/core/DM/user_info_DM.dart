import 'package:red_cell/core/constant.dart';

class UserInfoDm {
  String? docId;
  String? userName;
  String? emailAddress;
  String? password;
  String? birthdayDate;
  String? country;
  String? phoneNumber;
  bool? isFemale;

  UserInfoDm({
    this.docId,
    this.userName,
    this.emailAddress,
    this.password,
    this.birthdayDate,
    this.country,
    this.phoneNumber,
    this.isFemale,
  });
  factory UserInfoDm.fromJson(json,String docId){
    return UserInfoDm(
        birthdayDate: json[fireStoreUsersBirthDate],
      country: json[fireStoreUsersCountry],
      phoneNumber: json[fireStoreUsersPhoneNumber],
      isFemale: json[fireStoreUsersGender],
      userName: json[fireStoreUsersUserName],
      password: json[fireStoreUsersPassword],
      emailAddress: json[fireStoreUsersUid],
      docId: docId
    );
  }
}
