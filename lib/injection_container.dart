import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:user_generator/features/home/domain/repository/home_repository.dart';
import 'package:user_generator/features/home/domain/usecase/home_usecase.dart';

import 'features/home/data/datasources/home_remote_data_source.dart';
import 'features/home/data/repository/home_repository_impl.dart';
import 'features/home/presentation/blocs/home_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
        () => HomeBloc(useCase: sl()),
  );

  // Use cases
  sl.registerLazySingleton<HomeUseCase>(() => HomeUseCaseImpl(repository: sl()));

  // Repository
  sl.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(client: sl()),
  );

  //! Network Module
  sl.registerLazySingleton(() => http.Client());
}
