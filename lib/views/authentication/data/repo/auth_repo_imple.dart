import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:red_cell/core/failure/failure.dart';
import 'package:red_cell/views/authentication/data/repo/auth_repo.dart';
import 'package:red_cell/core/remote_storage/firebase_authentication.dart';

class AuthRepoImple extends AuthRepo {
  @override
  Future<Either<Failure, void>> createAccount(UserInfoDm userInfoDm) async {
    try {
      await FirebaseAuthentication.createEmailAndPassword(userInfoDm);
      return Right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(FireBaseFailure.fromSighup(e));
      }
      return Left(FireBaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logIn(
    String emailAddress,
    String password,
  ) async {
    try {
      await FirebaseAuthentication.login(emailAddress, password);
      return Right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(FireBaseFailure.fromLogin(e));
      }
      return Left(FireBaseFailure(e.toString()));
    }
  }
}
