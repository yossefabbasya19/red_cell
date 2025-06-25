import 'package:red_cell/core/constant.dart';

class UserInfoDm {
  static UserInfoDm? userInfoDm;
  String? docId;
  String? userName;
  String? emailAddress;
  String? password;
  String? birthdayDate;
  String? country;
  String? phoneNumber;
  bool? isFemale;
  List? myDonation=[];
  String? imagePath;

  UserInfoDm({
    this.docId,
    this.userName,
    this.emailAddress,
    this.password,
    this.birthdayDate,
    this.country,
    this.phoneNumber,
    this.isFemale,
    this.imagePath,
    this.myDonation
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
      myDonation: json['myDonation'],
      docId: docId,
      imagePath: json[fireStoreUsersProfileImage]
    );
  }
  toJson(){
    return{
      fireStoreUsersBirthDate:birthdayDate,
      fireStoreUsersCountry:country,
      fireStoreUsersPhoneNumber:phoneNumber,
      fireStoreUsersGender:isFemale,
      fireStoreUsersUserName:userName,
      fireStoreUsersUid:emailAddress,
      fireStoreUsersProfileImage:imagePath,
      'myDonation':myDonation
    };
  }
}
