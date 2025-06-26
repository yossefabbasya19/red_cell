import 'package:dartz/dartz.dart';
import 'package:red_cell/core/failure/failure.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failure, void>> forgetPassword(String email);
}
