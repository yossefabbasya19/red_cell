part of 'dontation_details_cubit.dart';

@immutable
sealed class DonationDetailsState {}

final class DonationDetailsInitial extends DonationDetailsState {}

final class DonationDetailsLoading extends DonationDetailsState {}

final class DonationDetailsSuccess extends DonationDetailsState {}

final class DonationDetailsFailure extends DonationDetailsState {
  final String errorMessage;

  DonationDetailsFailure(this.errorMessage);
}
