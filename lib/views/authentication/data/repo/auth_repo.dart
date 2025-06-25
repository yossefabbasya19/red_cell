import 'package:dartz/dartz.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:red_cell/core/failure/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> createAccount(UserInfoDm userInfoDm);
  Future<Either<Failure,void>> logIn( String emailAddress, String password);
}
