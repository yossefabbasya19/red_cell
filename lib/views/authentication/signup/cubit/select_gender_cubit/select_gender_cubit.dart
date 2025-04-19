import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_cell/views/authentication/signup/cubit/select_gender_cubit/select_gender_state.dart';

class SelectGenderCubit extends Cubit<SelectGenderState> {
  SelectGenderCubit() : super(SelectGenderInitial());
   bool isFemale = false;

  void switchGender() {
    isFemale = !isFemale;
    emit(SelectGenderInitial());
  }
}
