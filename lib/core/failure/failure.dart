import 'package:firebase_auth/firebase_auth.dart';

class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class FireBaseFailure extends Failure {
  FireBaseFailure(super.errorMessage);

  factory FireBaseFailure.fromLogin(FirebaseAuthException failure) {
    if (failure.code == 'user-not-found') {
      return FireBaseFailure('No user found for that email.');
    } else if (failure.code == 'wrong-password') {
      return FireBaseFailure('Wrong password provided for that user.');
    }
    return FireBaseFailure(failure.message!);
  } factory FireBaseFailure.fromSighup(FirebaseAuthException failure) {
    if (failure.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (failure.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return FireBaseFailure(failure.message!);
  }
}
