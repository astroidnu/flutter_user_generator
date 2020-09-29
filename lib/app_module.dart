import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:user_generator/user_generator_app.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [Bind((i) => http.Client())];

  @override
  Widget get bootstrap => UserGeneratorApp();

  @override
  List<ModularRouter> get routers => [];
}
