import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../model/user_generator_model.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<UserGeneratorModel> getUserGenerator();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({@required this.client});

  @override
  Future<UserGeneratorModel> getUserGenerator() async {
    final response = await http.get('https://randomuser.me/api/?results=10');
    if (response.statusCode == 200) {
      return UserGeneratorModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
}