import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/core/constant.dart';
import 'package:red_cell/core/remote_storage/remote_storage.dart';
import 'package:red_cell/views/request_details/cubit/add_donation_state.dart';

class AddDonationCubit extends Cubit<AddDonationState> {
  AddDonationCubit() : super(AddDonationInitial());
  late int totalUnits;
  String validTime = DateFormat("Md").format(DateTime.now());
  late String pateintName;
  String bloodType = "A+";
  String requestType = 'Blood';
  late String phoneNumber;
  late String hospitalName;
  String hospitalGovernorateAddress = 'Beheira';
  late String hospitalCityAddress;
  double? lat;
  double? long;

  void addDonationRequest() {
    emit(AddDonationLoading());
    try {
      RemoteStorage().addDonationRequest({
        fireStoreDonationRequestsTotalUnits: totalUnits,
        fireStoreDonationRequestsValidTime: validTime,
        fireStoreDonationRequestsPateintName: pateintName,
        fireStoreDonationRequestsBloodType: bloodType,
        fireStoreDonationRequestsRequestType: requestType,
        fireStoreDonationRequestsPhoneNumber: phoneNumber,
        fireStoreDonationRequestsHospitalName: hospitalName,
        fireStoreDonationRequestsHospitalGovernorateAddress:
            hospitalGovernorateAddress,
        fireStoreDonationRequestsHospitalCityAddress: hospitalCityAddress,
        fireStoreDonationRequestsLocationLat: lat,
        fireStoreDonationRequestsLocationLong: long,
        fireStoreDonationRequestsCreateAt: DateTime.now(),
        fireStoreDonationRequestsUid: FirebaseAuth.instance.currentUser!.email,
        fireStoreDonationRequestsProgressState: false,
      });
      emit(AddDonationSuccess());
    } catch (e) {
      emit(AddDonationFailure(errMessage: e.toString()));
    }
  }
}
