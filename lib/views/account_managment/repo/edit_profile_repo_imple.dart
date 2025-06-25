import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:red_cell/core/failure/failure.dart';
import 'package:red_cell/core/remote_storage/firebase_authentication.dart';
import 'package:red_cell/views/account_managment/repo/edit_profile_repo.dart';
@Injectable(as: EditProfileRepo)
class EditProfileRepoImple extends EditProfileRepo {
  @FactoryMethod()
  EditProfileRepoImple();
  Future<Either<Failure, void>> editProfile(UserInfoDm infoAfterEdit) async {
    try {
      await FirebaseAuthentication.editProfile(infoAfterEdit);
      return Right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FireBaseFailure(e.message!));
      }
      return Left(FireBaseFailure(e.toString()));
    }
  }
}
