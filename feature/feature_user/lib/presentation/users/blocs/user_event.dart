import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetUsers extends UserEvent {}
