import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:red_cell/views/forget_password/data/repo/forget_password_repo.dart';

part 'forget_password_state.dart';
@Injectable()
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  @FactoryMethod()
  ForgetPasswordCubit(this.forgetPasswordRepo) : super(ForgetPasswordInitial());
  final ForgetPasswordRepo forgetPasswordRepo;

  forgetPassword(String email) async {
    emit(ForgetPasswordLoading());
    var result = await forgetPasswordRepo.forgetPassword(email);
    result.fold(
      (l) {
        emit(ForgetPasswordFailure(l.errorMessage));
      },
      (r) {
        emit(ForgetPasswordSuccess());
      },
    );
  }
}
