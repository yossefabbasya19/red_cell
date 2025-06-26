import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:red_cell/core/constant.dart';
import 'package:red_cell/core/failure/failure.dart';
import 'package:red_cell/core/remote_storage/firebase_authentication.dart';
import 'package:red_cell/views/donation_details/data/repo/donation_details_repo.dart';
@Injectable(as: DonationDetailsRepo)
 class DonationDetailsRepoImple extends DonationDetailsRepo {
  @FactoryMethod()
  DonationDetailsRepoImple();
  @override
  Future<Either<Failure, void>> addDonation(String donationPostId) async {
    try {
      if(UserInfoDm.userInfoDm!.myDonation!.contains(donationPostId))return Right(null);
      UserInfoDm.userInfoDm!.myDonation!.add(donationPostId);
      UserInfoDm.userInfoDm!.myDonation!.toSet().toList();
      await FirebaseAuthentication.editProfile(UserInfoDm.userInfoDm!);
      return Right(null);
    } on Exception catch (e) {
      if (e is FirebaseException) {
        return Left(FireBaseFailure(e.message!));
      }
      return Left(FireBaseFailure(e.toString()));
    }
  }
}
