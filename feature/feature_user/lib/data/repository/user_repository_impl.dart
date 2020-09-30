import 'package:flutter/foundation.dart';

import '../../domain/entity/user.dart';
import '../../domain/repository/user_repository.dart';
import '../datasources/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({@required this.userRemoteDataSource});

  @override
  Future<List<User>> getUserGenerator() async {
    var users = List<User>();
    users.clear();
    var data = await userRemoteDataSource.getUserGenerator();
    data.results.forEach((element) {
      var user = User(
          name: "${element.name.first.trim()} ${element.name.last.trim()}",
          email: element.email,
          photoUrl: element.picture.medium);
      users.add(user);
    });
    return users;
  }
}