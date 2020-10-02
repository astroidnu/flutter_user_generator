import 'package:feature_user/domain/entity/user.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class UsersScreenRouter {
    void goToUserDetailScreen(User user);
}

class UsersScreeRouterImpl implements UsersScreenRouter {
  @override
  void goToUserDetailScreen(User user) {
    Modular.link.pushNamed('/user/detail', arguments: user);
  }

}