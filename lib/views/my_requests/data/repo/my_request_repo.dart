import 'package:dartz/dartz.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/core/failure/failure.dart';

abstract class MyRequestRepo {
  Future<Either<Failure, void>> updateDonationState(
    DonationDetailsDm donationDetails,
  );
}
