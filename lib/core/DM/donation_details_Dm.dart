import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:red_cell/core/constant.dart';

class DonationDetailsDm {
  String docID;

  String uid;
  int totalUnits;
  int totalUnitsReceived;
  Timestamp createAt;
  String validTime;
  String pateintName;
  String bloodType;
  String requestType;
  String hospitalName;
  String hospitalGovernorateAddress;
  String hospitalCityAddress;
  String phoneNumber;
  double lat;
  double lng;
  bool progressState;

  DonationDetailsDm({
    required this.uid,
    required this.totalUnits,
    required this.totalUnitsReceived,
    required this.createAt,
    required this.validTime,
    required this.pateintName,
    required this.bloodType,
    required this.requestType,
    required this.hospitalName,
    required this.hospitalGovernorateAddress,
    required this.hospitalCityAddress,
    required this.phoneNumber,
    required this.lat,
    required this.lng,
    required this.docID,
    required this.progressState,
  });

  factory DonationDetailsDm.fromJson(json, String docID) {
    return DonationDetailsDm(
      totalUnits: json[fireStoreDonationRequestsTotalUnits],
      totalUnitsReceived: json[fireStoreDonationRequestsTotalUnits],
      createAt: json[fireStoreDonationRequestsCreateAt],
      validTime: json[fireStoreDonationRequestsValidTime],
      pateintName: json[fireStoreDonationRequestsPateintName],
      bloodType: json[fireStoreDonationRequestsBloodType],
      requestType: json[fireStoreDonationRequestsRequestType],
      hospitalName: json[fireStoreDonationRequestsHospitalName],
      hospitalGovernorateAddress:
          json[fireStoreDonationRequestsHospitalGovernorateAddress],
      hospitalCityAddress: json[fireStoreDonationRequestsHospitalCityAddress],
      phoneNumber: json[fireStoreDonationRequestsPhoneNumber],
      lat: json[fireStoreDonationRequestsLocationLat],
      lng: json[fireStoreDonationRequestsLocationLong],
      docID: docID,
      uid: json[fireStoreDonationRequestsUid],
      progressState: json[fireStoreDonationRequestsProgressState],
    );
  }
}
