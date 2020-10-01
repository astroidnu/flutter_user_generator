import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String photoUrl;

  User({
    @required this.name,
    @required this.email,
    @required this.photoUrl
  });

  @override
  List<Object> get props => [name, email, photoUrl];
}