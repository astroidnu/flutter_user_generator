import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../lib/domain/entity/user.dart';
import '../../lib/domain/repository/user_repository.dart';
import '../../lib/domain/usecase/user_use_case.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  UserUseCase useCase;
  MockUserRepository repository;

  setUp((){
    repository = MockUserRepository();
    useCase = UserUseCaseImpl(repository: repository);
  });

  test('usecase call  get user generator should call repository get generator', () async {
    useCase.getUserGenerator();
    verify(repository.getUserGenerator()).called(1);
  });

  test('usecase call getuser generator method should get list of user',() async {
    var users = List<User>();
    when(repository.getUserGenerator()).thenAnswer((_) async => users);

    final result = await useCase.getUserGenerator();
    expect(result, users);
    verify(repository.getUserGenerator());
    verifyNoMoreInteractions(repository);
  });


}

