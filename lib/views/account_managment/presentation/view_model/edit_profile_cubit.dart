import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:red_cell/views/account_managment/repo/edit_profile_repo.dart';

import '../../repo/edit_profile_repo.dart';

part 'edit_profile_state.dart';
@Injectable()
class EditProfileCubit extends Cubit<EditProfileState> {
  @FactoryMethod()
  EditProfileCubit(this.editProfileRepo) : super(EditProfileInitial());
  final EditProfileRepo editProfileRepo;
  String imagePath='';
  void updateImage(String newImage){
    imagePath = newImage;
  }
  editProfile(UserInfoDm infoAfterEdit) async {
    emit(EditProfileLoading());
    var result = await editProfileRepo.editProfile(infoAfterEdit);
    result.fold(
      (l) {
        emit(EditProfileFailure(l.errorMessage));
      },
      (r) {
        emit(EditProfileSuccess());
      },
    );
  }
}
