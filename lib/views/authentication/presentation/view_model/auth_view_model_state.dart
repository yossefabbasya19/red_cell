part of 'auth_view_model_cubit.dart';

@immutable
sealed class AuthViewModelState {}

final class AuthViewModelInitial extends AuthViewModelState {}
final class LogInLoading extends AuthViewModelState {}
final class LogInSuccess extends AuthViewModelState {
  //final UserInfoDm? userInfoDm;

  LogInSuccess(/*{required this.userInfoDm}*/);
}
final class LogInFailure extends AuthViewModelState {
  final String errMassage;

  LogInFailure({required this.errMassage});

}
final class SignUpInitial extends AuthViewModelState {}
final class SignUpLoading extends AuthViewModelState {}
final class SignUpSuccess extends AuthViewModelState {}
final class SignUpFailure extends AuthViewModelState {
  final String errMassage;

  SignUpFailure({required this.errMassage});

}

final class SelectGenderInitial extends AuthViewModelState {}

