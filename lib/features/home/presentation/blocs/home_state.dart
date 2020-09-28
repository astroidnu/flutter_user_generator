import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../domain/entity/home.dart';

@immutable
abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends HomeState {}

class Loading extends HomeState {}

class Loaded extends HomeState {
  final List<User> users;

  Loaded({@required this.users});

  @override
  List<Object> get props => [users];
}
