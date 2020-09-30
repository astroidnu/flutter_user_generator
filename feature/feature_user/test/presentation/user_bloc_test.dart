import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../lib/domain/entity/user.dart';
import '../../lib/domain/usecase/user_use_case.dart';
import '../../lib/presentation/users/blocs/user_bloc.dart';
import '../../lib/presentation/users/blocs/user_event.dart';
import '../../lib/presentation/users/blocs/user_state.dart';

class MockUserUseCase extends Mock implements UserUseCase {}

void main() {
  UserBloc bloc;
  MockUserUseCase useCase;

  setUp(() {
    useCase = MockUserUseCase();
    bloc = UserBloc(useCase: useCase);
  });

  test(
    'bloc add state get users with positive return should return'
        'loading and loaded state',
        () async {
      var users = List<User>();

      // arrange
      when(useCase.getUserGenerator()).thenAnswer((_) async => users);

      expectLater(bloc, emitsInOrder([Loading(), Loaded(users: users)]));
      bloc.add(GetUsers());
    },
  );
}
