import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore =
      FirebaseFirestore.instance;

  Future<String?> register({
    required String fullname,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid =
          userCredential.user!.uid;

      await firestore
          .collection('users')
          .doc(uid)
          .set({
        'fullname': fullname,
        'email': email,
        'instagram': '',
        'photoUrl': '',
      });

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> login({
  required String email,
  required String password,
}) async {
  try {
    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return null;
  } on FirebaseAuthException catch (e) {
    return e.message;
  }
}

  Future<String?> resetPassword({
  required String email,
}) async {
  try {
    await auth.sendPasswordResetEmail(
      email: email,
    );

    return null;
  } on FirebaseAuthException catch (e) {
    return e.message;
  }
}
}