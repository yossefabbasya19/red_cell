import 'package:dartz/dartz.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/core/failure/failure.dart';
import 'package:red_cell/core/remote_storage/firebase_authentication.dart';

abstract class RequestDetailsRepo {
  Future<Either<Failure, void>> addDonationRequest(
    DonationDetailsDm donationDetail,
  );
}
