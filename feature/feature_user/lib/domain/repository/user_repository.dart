import '../entity/user.dart';

abstract class UserRepository {
  Future<List<User>> getUserGenerator();
}