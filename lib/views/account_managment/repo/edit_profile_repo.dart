import 'package:dartz/dartz.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:red_cell/core/failure/failure.dart';

abstract class EditProfileRepo {
  Future<Either<Failure,void>>editProfile( UserInfoDm infoAfterEdit,);
}