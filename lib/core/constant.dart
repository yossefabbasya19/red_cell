import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
String kSharedPreferenceBoardingState = "state";
String regExpValidateEmail =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
String regExpValidatePassword =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
//requests fireStore
String fireStoreDonationRequests ="donation-requests";
String fireStoreDonationRequestsTotalUnits ="totalUnits";
String fireStoreDonationRequestsValidTime ="validTime";
String fireStoreDonationRequestsPateintName ="pateintName";
String fireStoreDonationRequestsBloodType ="bloodType";
String fireStoreDonationRequestsRequestType ="requestType";
String fireStoreDonationRequestsPhoneNumber ="phoneNumber";
String fireStoreDonationRequestsHospitalName ="hospitalName";
String fireStoreDonationRequestsHospitalGovernorateAddress ="hospitalGovernorateAddress";
String fireStoreDonationRequestsHospitalCityAddress ="hospitalCityAddress";
String fireStoreDonationRequestsLocationLat ="lat";
String fireStoreDonationRequestsLocationLong ="long";
String fireStoreDonationRequestsCreateAt ="CreateAt";
String fireStoreDonationRequestsUid ="uid";
String fireStoreDonationRequestsProgressState ="ProgressState";
//users
String fireStoreUsers ="users";
String fireStoreUsersUid = 'uid';
String fireStoreUsersPhoneNumber = 'phoneNumber';
String fireStoreUsersUserName = 'userName';
String fireStoreUsersProfileImage = 'profileImage';
String fireStoreUsersBirthDate = 'birthdate';
String fireStoreUsersCountry = 'country';
String fireStoreUsersGender = 'isFemale';
String fireStoreUsersPassword = 'password';
List<String> dateFormatSignIn = [
  'yyyy',
  '-',
  'mm',
  '-',
  'dd',
];
final Map<String, List<String>> compatibilityBloodType = {
  'O-': ['O-'],
  'O+': ['O-', 'O+'],
  'A-': ['O-', 'A-'],
  'A+': ['O-', 'O+', 'A-', 'A+'],
  'B-': ['O-', 'B-'],
  'B+': ['O-', 'O+', 'B-', 'B+'],
  'AB-': ['O-', 'A-', 'B-', 'AB-'],
  'AB+': ['O-', 'O+', 'A-', 'A+', 'B-', 'B+', 'AB-', 'AB+'],
};
List<String> bloodTypes = ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"];
List<String> getEgyptGovernorates(BuildContext context){

    List<String> egyptGovernorates = [
    AppLocalizations.of(context)!.cairo,
  AppLocalizations.of(context)!.alexandria,
  AppLocalizations.of(context)!.giza,
  AppLocalizations.of(context)!.aswan,
  AppLocalizations.of(context)!.luxor,
  AppLocalizations.of(context)!.suez,
  AppLocalizations.of(context)!.dakahlia,
  AppLocalizations.of(context)!.sharqia,
  AppLocalizations.of(context)!.minya,
  AppLocalizations.of(context)!.qena,
  AppLocalizations.of(context)!.beheira,
  AppLocalizations.of(context)!.sohag,
  AppLocalizations.of(context)!.faiyum,
  AppLocalizations.of(context)!.ismailia,
  AppLocalizations.of(context)!.portSaid,
  AppLocalizations.of(context)!.damietta,
  AppLocalizations.of(context)!.asyut,
      AppLocalizations.of(context)!.kafrElSheikh,
      AppLocalizations.of(context)!.redSea,
  AppLocalizations.of(context)!.northSinai,
  AppLocalizations.of(context)!.southSinai,
  AppLocalizations.of(context)!.newValley,
  AppLocalizations.of(context)!.matrouh,
  AppLocalizations.of(context)!.beniSuef,
  AppLocalizations.of(context)!.monufia,
  ];
    return egyptGovernorates;
}
List<String> egyptGovernorates = [
  'Cairo',
  'Alexandria',
  'Giza',
  'Aswan',
  'Luxor',
  'Suez',
  'Dakahlia',
  'Sharqia',
  'Minya',
  'Qena',
  'Beheira',
  'Sohag',
  'Faiyum',
  'Ismailia',
  'Port-Said',
  'Damietta',
  'Asyut',
  'Kafr-El-Sheikh',
  'Red-Sea',
  'North-Sinai',
  'South-Sinai',
  'New-Valley',
  'Matrouh',
  'Beni-Suef',
  'Monufia',
];
