import './user_api_provider.dart';
import '../models/user.dart';

class UsersRepository {
  final _usersProvider = UserApiProvider();
  Future<List<User>> getAllUsers() => _usersProvider.getUsers();
}
