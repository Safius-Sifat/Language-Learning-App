import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/firebase_providers.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _auth;

  AuthRepository(
      {required GoogleSignIn googleSignIn, required FirebaseAuth firebaseAuth})
      : _googleSignIn = googleSignIn,
        _auth = firebaseAuth;

  Stream<User?> get authStateChange => _auth.authStateChanges();
  User? get currentUser => _auth.currentUser;

  Future<void> signInUsingGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      throw Exception('Google sign in failed');
    }

    final googleAuth = await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _auth.signInWithCredential(credential);
  }

  Future<void> registerWithEmail({
    required String email,
    required String password,
  }) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> logOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  final googleSignIn = ref.watch(googleSignInProvider);
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return AuthRepository(googleSignIn: googleSignIn, firebaseAuth: firebaseAuth);
}

@Riverpod(keepAlive: true)
Stream<User?> authStateChange(AuthStateChangeRef ref) {
  return ref.watch(authRepositoryProvider).authStateChange;
}
