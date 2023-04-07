import '../../Model/models.dart';


abstract class UserRepositoryIndex {
  Stream<User> getUser(String id);
  Future<void> createUser(User user);
  Future<void> updateUser(User user);
}