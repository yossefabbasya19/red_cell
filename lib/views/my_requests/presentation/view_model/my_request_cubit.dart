import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/views/my_requests/data/repo/my_request_repo.dart';

part 'my_request_state.dart';
@Injectable()
class MyRequestCubit extends Cubit<MyRequestState> {
  @FactoryMethod()
  MyRequestCubit(this.myRequestRepo) : super(MyRequestInitial());
  final MyRequestRepo myRequestRepo;

  Future<void> updateRequestState(DonationDetailsDm donationDetails) async {
    emit(MyRequestLoading());
    var result = await myRequestRepo.updateDonationState(donationDetails);
    result.fold(
      (l) {
        emit(MyRequestFailure(l.errorMessage));
      },
      (r) {
        emit(MyRequestSuccess());
      },
    );
  }
}
