import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:user_generator/features/home/domain/entity/home.dart';
import 'package:user_generator/features/home/domain/usecase/home_usecase.dart';
import 'package:user_generator/features/home/presentation/blocs/home_bloc.dart';
import 'package:user_generator/features/home/presentation/blocs/home_event.dart';
import 'package:user_generator/features/home/presentation/blocs/home_state.dart';

class MockHomeUseCase extends Mock implements HomeUseCase {}

void main() {
  HomeBloc bloc;
  MockHomeUseCase mockHomeUseCase;

  setUp(() {
    mockHomeUseCase = MockHomeUseCase();
    bloc = HomeBloc(useCase: mockHomeUseCase);
  });

  test('initialState should be Empty', () {
    expect(bloc.initialState, equals(Empty()));
  });

  test(
    'bloc add state get users with positive return should return'
    'loading and loaded state',
    () async {
      var users = List<User>();

      // arrange
      when(mockHomeUseCase.getUserGenerator()).thenAnswer((_) async => users);

      expectLater(bloc, emitsInOrder([Loading(), Loaded(users: users)]));
      bloc.add(GetUsers());
    },
  );
}
