import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:red_cell/core/failure/failure.dart';
import 'package:red_cell/core/remote_storage/firebase_authentication.dart';
import 'package:red_cell/views/forget_password/data/repo/forget_password_repo.dart';
@Injectable(as:ForgetPasswordRepo )
class ForgetPasswordRepoImple extends ForgetPasswordRepo {
  @FactoryMethod()
  ForgetPasswordRepoImple();
  @override
  Future<Either<Failure, void>> forgetPassword(String email) async {
    try {
      await FirebaseAuthentication.forgetPassword(email);
      return Right(null);
    } on Exception catch (e) {
      if (e is FirebaseException) {
        return Left(FireBaseFailure(e.message!));
      }
      return Left(FireBaseFailure(e.toString()));
    }
  }
}
