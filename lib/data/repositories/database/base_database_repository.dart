import '../../models/user_model.dart';

abstract class BaseDatabaseRepository {
  Future<User> getUser(String userID);
  Future<void> createUser(User user);
  Future<void> updateUser(User user);
  Future<void> updateUserPictures(User user, String imageName);
}
