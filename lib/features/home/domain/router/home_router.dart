import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:user_generator/features/detail/presentation/detail_user_screen.dart';
import 'package:user_generator/features/home/domain/entity/home.dart';

abstract class HomeRouter {
   goToDetailScreen(User user);
}

class HomeRouterImpl implements HomeRouter {
  final BuildContext context;
  HomeRouterImpl({@required this.context});

  @override
  goToDetailScreen(User user) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailUserScreen(user: user)
        )
    );
  }

}