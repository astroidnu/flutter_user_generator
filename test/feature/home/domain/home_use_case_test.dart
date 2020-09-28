import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:user_generator/features/home/domain/entity/home.dart';
import 'package:user_generator/features/home/domain/repository/home_repository.dart';
import 'package:user_generator/features/home/domain/usecase/home_usecase.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  HomeUseCase homeUseCase;
  MockHomeRepository mockHomeRepository;

  setUp((){
    mockHomeRepository = MockHomeRepository();
    homeUseCase = HomeUseCaseImpl(repository: mockHomeRepository);
  });

  test('usecase call  get user generator should call repository get generator', () async {
    homeUseCase.getUserGenerator();
    verify(mockHomeRepository.getUserGenerator()).called(1);
  });

  test('usecase call getuser generator method should get list of user',() async {
    var users = List<User>();
    when(mockHomeRepository.getUserGenerator()).thenAnswer((_) async => users);

    final result = await homeUseCase.getUserGenerator();
    expect(result, users);
    verify(mockHomeRepository.getUserGenerator());
    verifyNoMoreInteractions(mockHomeRepository);
  });


}

