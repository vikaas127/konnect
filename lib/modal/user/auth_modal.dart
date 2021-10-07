import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AuthModel extends ChangeNotifier {
  FirebaseAuth _instance = FirebaseAuth.instance;

  User? get user => _instance.currentUser;

  String get uid => user?.uid ?? 'null';

  bool get isSignedIn => user == null;

  AuthModel() {
    _instance.authStateChanges().listen((user) {
      print('AuthStateChanges  => $user');
      notifyListeners();
    });
  }

  Future<void> signOut() async {
    await _instance.signOut();
    notifyListeners();
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    try {
      print('Authentication  => $email, $password');
      var _user = await _instance.signInWithEmailAndPassword(
        password: password,
        email: email,
      );
      print('Authentication => $_user');
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException => $e');
      print('FirebaseAuthException code => ${e.code}');
      print('FirebaseAuthException email => ${e.email}');
      print('FirebaseAuthException message => ${e.message}');
      print('FirebaseAuthException tenantId => ${e.tenantId}');
      print('FirebaseAuthException credential => ${e.credential}');
      print('FirebaseAuthException phoneNumber => ${e.phoneNumber}');
      // user-not-found
      // wrong-password
      // too-many-requests
    } catch (e) {
      print('AuthException -> $e');
    }
  }
  Future<void> forgotpass({
    required String email,

  }) async {
    try {
      print('Authentication  => $email');
       await _instance.sendPasswordResetEmail(email: email);

    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException => $e');

      // user-not-found
      // wrong-password
      // too-many-requests
    } catch (e) {
      print('AuthException -> $e');
    }
  }

  static AuthModel of(BuildContext context) {
    return context.read<AuthModel>();
  }

  @override
  String toString() => 'User Id $uid';
}
/******************************
 * disable null safety
    // @dart=2.10
 * */
