import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:red_cell/core/helper/show_snack_bar.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';
import 'package:red_cell/core/remote_storage/update_user_info.dart';
import 'package:red_cell/views/authentication/signup/firebase_authentication/firebase_authentication.dart';

Future<void> editUserInfo(
  BuildContext context,
  GlobalKey<FormState> formKey,
  UserInfoDm userInfoDm,
  UserInfoDm infoAfterEdit,
  bool isChange,
) async {
  if (formKey.currentState!.validate()) {
    String currentEmail = await FirebaseAuth.instance.currentUser!.email!;

    if (infoAfterEdit.phoneNumber == userInfoDm.phoneNumber ||
        await FirebaseAuthentication.checkPhoneNumberAlreadyInUse(
          context,
          infoAfterEdit.phoneNumber!,
        )) {
      if (infoAfterEdit.emailAddress == currentEmail ||
          await FirebaseAuthentication.checkEmailAlreadyInUse(context, infoAfterEdit.emailAddress!)) {
        try {
          await FirebaseAuth.instance.currentUser!
              .updateEmail(infoAfterEdit.emailAddress!);
          updateUserInfo(
            userInfoDm.docId!,
            infoAfterEdit
          );
          if (isChange) {
            FirebaseAuth.instance.signOut();
            Navigator.pushReplacementNamed(context, MyRoutes.login);
          }
        } catch (e) {
          showSnackBar(context, e.toString());
        }
      }
    }
  }
}
