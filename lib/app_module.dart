import 'package:feature_user/di/user_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'splash_screen.dart';
import 'user_generator_app.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [Bind((i) => http.Client())];

  @override
  Widget get bootstrap => UserGeneratorApp();

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/splash", child: (context, args) => SplashScreen()),
        ModularRouter("/users", module: UserModule()),
      ];
}
