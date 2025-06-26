import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/core/failure/failure.dart';
import 'package:red_cell/core/remote_storage/firebase_authentication.dart';
import 'package:red_cell/views/my_requests/data/repo/my_request_repo.dart';
@Injectable(as:MyRequestRepo )
class MyRequestRepoImple extends MyRequestRepo {
  @FactoryMethod()
  MyRequestRepoImple();
  @override
  Future<Either<Failure, void>> updateDonationState(
    DonationDetailsDm donationDetails,
  ) async {
    try {
      await FirebaseAuthentication.updateDonationState(donationDetails);
      return Right(null);
    } on Exception catch (e) {
      if(e is FirebaseException){
        return Left(FireBaseFailure(e.message!));
      }
      return Left(FireBaseFailure(e.toString()));
    }
  }
}
