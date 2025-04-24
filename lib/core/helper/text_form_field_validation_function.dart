
import 'package:red_cell/core/constant.dart';

String? phoneValidation(String ?value) {
  if(value!.isNotEmpty){
    if (!((value.substring(0, 3) == '010') ||
            (value.substring(0, 3) == '011') ||
            (value.substring(0, 3) == '012') ||
            (value.substring(0, 3) == '015')) ||
        !(value.length == 11)) {
      return "invalid number";
    }
  }else{
    return "required";
  }
  return null;
}

String? passwordValidation(value) {
  if (!RegExp(regExpValidatePassword).hasMatch(value!)) {
    return "enter strong password";
  }
  return null;
}

String? emailValidation(value) {
  if (!RegExp(regExpValidateEmail).hasMatch(value!)) {
    return "enter correct email";
  }
  return null;
}

String? userNameValidation(value) {
  if (value!.isEmpty) {
    return "required";
  }
  return null;
}
