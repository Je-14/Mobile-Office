// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

class FireAuth {
  late final FirebaseAuth _fireAuth;

  FireAuth(this._fireAuth);

  Stream<User?> get authStateChanges => _fireAuth.authStateChanges();

  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _fireAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'signed in';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp(
      {required String email, required String password}) async {
    try {
      await _fireAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'Account Created';
    } catch (e) {
      return '';
    }
  }
}
