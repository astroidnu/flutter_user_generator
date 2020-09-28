
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:user_generator/features/home/data/models/home_generator_model.dart';



abstract class RemoteDataSource {
  Future<UserGeneratorModel> getUserGenerator();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({@required this.client});

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