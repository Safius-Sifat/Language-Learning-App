class ClassRepository{

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  const ClassRepository({required FirebaseAuth firebaseAuth, required FirebaseFirestore firestore})
      : _firestore = firestore,
        _auth = firebaseAuth;

}
