import 'dart:async';

import 'package:feature_user/domain/router/users_screen_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'blocs/user_bloc.dart';
import 'blocs/user_event.dart';
import 'blocs/user_state.dart';
import 'item_user.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  Completer<void> _refreshCompleter;

  final UsersScreenRouter _router = UsersScreeRouterImpl();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<UserBloc>(),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Home"),
          ),
          body: Center(
            child: RefreshIndicator(
              onRefresh: () {
                BlocProvider.of<UserBloc>(context).add(GetUsers());
                return _refreshCompleter.future;
              },
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is Empty) {
                    BlocProvider.of<UserBloc>(context).add(GetUsers());
                  } else if (state is Loaded) {
                    _refreshCompleter?.complete();
                    _refreshCompleter = Completer();
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        var user = state.users[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ItemUser(
                            name: user.name,
                            email: user.email,
                            url: user.photoUrl,
                            onPressed: () {
                              _router.goToUserDetailScreen(user);
                            },
                          ),
                        );
                      },
                      itemCount: state.users.length,
                    );
                  }
                  return Text("Loading...");
                },
              ),
            ),
          )),
    );
  }
}
