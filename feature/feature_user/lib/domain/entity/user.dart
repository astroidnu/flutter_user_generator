import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class User extends Equatable {
  String name;
  String email;
  String photoUrl;

  User({
    @required this.name,
    @required this.email,
    @required this.photoUrl
  });

  @override
  List<Object> get props => [name, email, photoUrl];
}