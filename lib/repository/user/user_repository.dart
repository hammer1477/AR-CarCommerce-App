import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Model/models.dart';

import 'user_repository_index.dart';

class UserRepository extends UserRepositoryIndex {

  final FirebaseFirestore _firebaseFirestore;

  UserRepository({
    FirebaseFirestore? firebaseFirestore,
}) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;



  @override
  Future<void> createUser(User user) async {
    await _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .set(user.toDocument());
  }

  @override
  Stream<User> getUser(String id) {
    return _firebaseFirestore
        .collection('users')
        .doc(id)
        .snapshots()
        .map((snap) => User.fromSnapshot(snap));
  }

  @override
  Future<void> updateUser(User user) async{
    return _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .update(user.toDocument())
        .then((value) => print('updated document'));
  }

}
