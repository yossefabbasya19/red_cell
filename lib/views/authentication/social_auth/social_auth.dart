import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';
import 'package:red_cell/views/authentication/signup/firebase_authentication/firebase_authentication.dart';

Future<UserCredential> signInWithGoogle(BuildContext context) async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  UserCredential user = await FirebaseAuth.instance.signInWithCredential(
    credential,
  );
  if (await FirebaseAuthentication.checkEmailAlreadyInUse(
    context,
    user.user!.email!,
  )) {
    FirebaseAuthentication.addUserinfo(
      UserInfoDm(
        emailAddress: user.user!.email,
        userName: user.user!.displayName,
      ),
      user,
    );
  }
  Navigator.pushReplacementNamed(context, MyRoutes.mainLayout);
  return user;
}
