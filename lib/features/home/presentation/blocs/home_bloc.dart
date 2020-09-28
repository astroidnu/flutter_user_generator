import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../domain/usecase/home_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase useCase;

  HomeBloc({@required this.useCase, concrete}) : super(Empty());


  @override
  HomeState get initialState => Empty();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetUsers) {
      yield Loading();
      final result = await useCase.getUserGenerator();
      yield Loaded(users: result);
    }
  }
}
