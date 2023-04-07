import 'package:firebase_auth/firebase_auth.dart' as auth;

import 'auth_repository_index.dart';

class AuthRepository extends AuthRepositoryIndex {
  final auth.FirebaseAuth _firebaseAuth;

  AuthRepository({
    auth.FirebaseAuth? firebaseAuth
}) : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;


  @override
  Future<void> login({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

    }
    on auth.FirebaseAuthException catch (e){
      print(e.message);
    }
  }

  @override
  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }

  @override
  Future<auth.User?> signUp({required String email, required String password}) async {
    try {
      print('try repo');
      print(email);
      print(password);
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      final user = credential.user;
      return user;

    }
    on auth.FirebaseAuthException catch(e) {
      print('catch repo');
      print(e.code);
      print(e.message);
    }

  }

  @override
  Stream<auth.User?> get user => _firebaseAuth.userChanges();

}