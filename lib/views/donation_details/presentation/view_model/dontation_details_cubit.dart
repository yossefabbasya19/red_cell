import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:red_cell/views/donation_details/data/repo/donation_details_repo.dart';

part 'dontation_details_state.dart';
@Injectable()
class DonationDetailsCubit extends Cubit<DonationDetailsState> {
  @FactoryMethod()
  DonationDetailsCubit(this.donationDetailsRepo)
    : super(DonationDetailsInitial());
  final DonationDetailsRepo donationDetailsRepo;

  Future<void> addDonation(String donationPostId) async {
    emit(DonationDetailsLoading());
    var result = await donationDetailsRepo.addDonation(donationPostId);
    result.fold(
      (l) {
        emit(DonationDetailsFailure(l.errorMessage));
      },
      (r) {
        emit(DonationDetailsSuccess());
      },
    );
  }
}
