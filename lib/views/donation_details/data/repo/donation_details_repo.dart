import 'package:dartz/dartz.dart';
import 'package:red_cell/core/failure/failure.dart';

abstract class DonationDetailsRepo {
  Future<Either<Failure,void>>addDonation(String donationPostId);
}