import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:language_learning_app/src/exception/app_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/firebase_constants.dart';
import '../../../utils/firebase_providers.dart';
import '../domain/user_model.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  AuthRepository(
      {required GoogleSignIn googleSignIn,
      required FirebaseAuth firebaseAuth,
      required FirebaseFirestore firestore})
      : _googleSignIn = googleSignIn,
        _firestore = firestore,
        _auth = firebaseAuth;

  CollectionReference get _user =>
      _firestore.collection(FirebaseConstants.usersCollection);
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

    final userCredential = await _auth.signInWithCredential(credential);
    if (userCredential.additionalUserInfo?.isNewUser ?? true) {
      final userModel = UserModel(
        id: userCredential.user?.uid,
        name: userCredential.user?.displayName,
        email: userCredential.user?.email ?? '',
        photoUrl: userCredential.user?.photoURL,
        createdAt: DateTime.now(),
        lastActive: DateTime.now(),
        isOnline: true,
      );
      await _user.doc(userCredential.user?.uid).set(userModel.toDocument());
    } // handle
  }

  Future<void> registerWithEmail({
    required String email,
    required String password,
  }) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (userCredential.additionalUserInfo?.isNewUser ?? true) {
      final userModel = UserModel(
        name: userCredential.user?.displayName,
        email: userCredential.user!.email!,
        photoUrl: userCredential.user?.photoURL,
        createdAt: DateTime.now(),
        lastActive: DateTime.now(),
        isOnline: true,
      );
      await _user.doc(userCredential.user?.uid).set(userModel.toDocument());
    } // handle
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

  Future<UserModel> getUserById(String id) async {
    return _user.doc(id).get().then((doc) => UserModel.fromDocument(doc));
  }

  Future<List<UserModel>> getUsers(List<String> ids) async {
    final users = await Future.wait(ids.map((id) => getUserById(id)));
    return users;
  }

  Future<void> sendPasswordResetEmail() async {
    if (currentUser == null || currentUser?.email == null) {
      throw UserNotFoundException;
    }
    return _auth.sendPasswordResetEmail(email: currentUser!.email!);
  }

  Future<void> deleteAccount() async {
    await _googleSignIn.signOut();
    await _auth.currentUser?.delete();
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
  final firestore = ref.watch(firestoreProvider);

  return AuthRepository(
      googleSignIn: googleSignIn,
      firebaseAuth: firebaseAuth,
      firestore: firestore);
}

@Riverpod(keepAlive: true)
Stream<User?> authStateChange(AuthStateChangeRef ref) {
  return ref.watch(authRepositoryProvider).authStateChange;
}

@riverpod
FutureOr<UserModel> fetchUserById(FetchUserByIdRef ref,
    {required String id}) async {
  return ref.read(authRepositoryProvider).getUserById(id);
}

@riverpod
FutureOr<List<UserModel>> fetchUsers(FetchUsersRef ref,
    {required List<String> ids}) async {
  return ref.read(authRepositoryProvider).getUsers(ids);
}
