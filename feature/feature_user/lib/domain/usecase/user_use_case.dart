import 'package:flutter/foundation.dart';

import '../entity/user.dart';
import '../repository/user_repository.dart';

abstract class UserUseCase {
  Future<List<User>> getUserGenerator();
}

class UserUseCaseImpl extends UserUseCase {
  final UserRepository repository;

  UserUseCaseImpl({@required this.repository});

  @override
  Future<List<User>> getUserGenerator() => repository.getUserGenerator();
}
