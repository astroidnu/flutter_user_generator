import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/usecase/user_use_case.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCase useCase;

  UserBloc({@required this.useCase, concrete}) : super(Empty());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is GetUsers) {
      yield Loading();
      final result = await useCase.getUserGenerator();
      yield Loaded(users: result);
    }
  }
}
