import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:red_cell/core/helper/show_snack_bar.dart';
import 'package:red_cell/views/authentication/data/repo/auth_repo.dart';
import 'package:red_cell/core/remote_storage/firebase_authentication.dart';

part 'auth_view_model_state.dart';

class AuthViewModelCubit extends Cubit<AuthViewModelState> {
  AuthViewModelCubit(this.authRepo) : super(AuthViewModelInitial());
  final AuthRepo authRepo;

  void logIn(String emailAddress, String password) async {
    emit(LogInLoading());
    var result = await authRepo.logIn(emailAddress, password);
    result.fold(
      (l) {
        emit(LogInFailure(errMassage: l.errorMessage));
      },
      (r) {
        emit(LogInSuccess());
      },
    );
  }

  bool isFemale = false;

  void switchGender() {
    isFemale = !isFemale;
    emit(SelectGenderInitial());
  }

  Future<void> createAccount(UserInfoDm userInfoDm) async {
    emit(SignUpLoading());
    var result = await authRepo.createAccount(userInfoDm);
    result.fold(
      (l) {
        emit(SignUpFailure(errMassage: l.errorMessage));
      },
      (r) {
        emit(SignUpSuccess());
      },
    );
  }
}
