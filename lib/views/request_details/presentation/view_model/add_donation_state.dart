
sealed class AddDonationState {}

final class AddDonationInitial extends AddDonationState {}
final class AddDonationLoading extends AddDonationState {}
final class AddDonationSuccess extends AddDonationState {}
final class AddDonationFailure extends AddDonationState {
  final String errMessage;

  AddDonationFailure({required this.errMessage});

}
