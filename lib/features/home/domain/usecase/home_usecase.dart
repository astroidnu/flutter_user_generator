import 'package:flutter/foundation.dart';
import 'package:user_generator/features/home/domain/entity/home.dart';
import 'package:user_generator/features/home/domain/repository/home_repository.dart';

abstract class HomeUseCase {
  Future<List<User>> getUserGenerator();
}

class HomeUseCaseImpl extends HomeUseCase {
  final HomeRepository repository;

  HomeUseCaseImpl({@required this.repository});

  @override
  Future<List<User>> getUserGenerator() => repository.getUserGenerator();
}