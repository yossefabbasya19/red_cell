part of 'my_request_cubit.dart';

@immutable
sealed class MyRequestState {}

final class MyRequestInitial extends MyRequestState {}
final class MyRequestLoading extends MyRequestState {}
final class MyRequestSuccess extends MyRequestState {}
final class MyRequestFailure extends MyRequestState {
  final String errorMessage;

  MyRequestFailure(this.errorMessage);
}
