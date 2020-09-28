import 'package:flutter/foundation.dart';
import 'package:user_generator/features/home/data/datasources/home_remote_data_source.dart';
import 'package:user_generator/features/home/domain/entity/home.dart';
import 'package:user_generator/features/home/domain/repository/home_repository.dart';


class HomeRepositoryImpl extends HomeRepository {
  final RemoteDataSource remoteDataSource;

  HomeRepositoryImpl({@required this.remoteDataSource});

  @override
  Future<List<User>> getUserGenerator() async {
    var users = List<User>();
    users.clear();
    var data = await remoteDataSource.getUserGenerator();
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
