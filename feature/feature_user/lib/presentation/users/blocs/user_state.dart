
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/entity/user.dart';

@immutable
abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends UserState {}

class Loading extends UserState {}

class Loaded extends UserState {
  final List<User> users;

  Loaded({@required this.users});

  @override
  List<Object> get props => [users];
}
