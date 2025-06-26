import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/core/failure/failure.dart';
import 'package:red_cell/core/remote_storage/firebase_authentication.dart';
import 'package:red_cell/views/request_details/data/repo/request_details_repo.dart';
@Injectable(as:RequestDetailsRepo )
class RequestDetailsRepoImple extends RequestDetailsRepo {
  @FactoryMethod()
  RequestDetailsRepoImple();
  @override
  Future<Either<Failure, void>> addDonationRequest(
    DonationDetailsDm donationDetail,
  ) async {
    try {
      await FirebaseAuthentication.addDonationRequest(donationDetail);
      return Right(null);
    } on Exception catch (e) {
      if (e is FirebaseException) {
        return Left(FireBaseFailure(e.message!));
      }
      return Left(FireBaseFailure(e.toString()));
    }
  }
}
