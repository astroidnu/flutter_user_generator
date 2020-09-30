import 'package:flutter_modular/flutter_modular.dart';

import '../data/datasources/user_remote_data_source.dart';
import '../data/repository/user_repository_impl.dart';
import '../domain/repository/user_repository.dart';
import '../domain/usecase/user_use_case.dart';
import '../presentation/users/blocs/user_bloc.dart';
import '../presentation/users/users_screen.dart';

class UserModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => UserBloc(useCase: i())),
    Bind<UserUseCase>((i) => UserUseCaseImpl(repository: i())),
    Bind<UserRepository>((i) => UserRepositoryImpl(userRemoteDataSource: i())),
    Bind<UserRemoteDataSource>((i) => UserRemoteDataSourceImpl(client: i()))
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter("/", child: (_, __) => UsersScreen()),
  ];

}