import 'package:user_generator/features/home/domain/entity/home.dart';

abstract class HomeRepository {
  Future<List<User>> getUserGenerator();
}