import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/views/request_details/data/repo/request_details_repo.dart';
import 'package:red_cell/views/request_details/presentation/view_model/add_donation_state.dart';

@Injectable()
class AddDonationCubit extends Cubit<AddDonationState> {
  @FactoryMethod()
  AddDonationCubit(this.requestDetailsRepo) : super(AddDonationInitial());
  final RequestDetailsRepo requestDetailsRepo;
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
  DonationDetailsDm? donationDetailsDm;

  void addDonationRequest() async {
    emit(AddDonationLoading());
    donationDetailsDm = DonationDetailsDm(
      uid: FirebaseAuth.instance.currentUser!.uid,
      totalUnits: totalUnits,
      totalUnitsReceived: 0,
      createAt: Timestamp.now(),
      validTime: validTime,
      pateintName: pateintName,
      bloodType: bloodType,
      requestType: requestType,
      hospitalName: hospitalName,
      hospitalGovernorateAddress: hospitalGovernorateAddress,
      hospitalCityAddress: hospitalCityAddress,
      phoneNumber: phoneNumber,
      lat: lat??0,
      lng: long??0,
      docID: "",
      progressState: false,
    );
    if (donationDetailsDm?.lat == 0 || donationDetailsDm?.lng == 0) {
      emit(AddDonationFailure(errMessage: "please select place in map"));
      return;
    }
    var result = await requestDetailsRepo.addDonationRequest(
      donationDetailsDm!,
    );
    result.fold(
      (l) {
        emit(AddDonationFailure(errMessage: l.errorMessage));
      },
      (r) {
        emit(AddDonationSuccess());
        lat = null;
        long = null;
      },
    );
  }
}
