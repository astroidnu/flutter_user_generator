import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_generator/features/home/domain/router/home_router.dart';

import 'blocs/home_bloc.dart';
import 'blocs/home_event.dart';
import 'blocs/home_state.dart';
import 'item_user.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  HomeRouter _router;
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _router = HomeRouterImpl(context: context);
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Center(
          child: RefreshIndicator(
            onRefresh: () {
              BlocProvider.of<HomeBloc>(context).add(GetUsers());
              return _refreshCompleter.future;
            },
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is Empty) {
                  BlocProvider.of<HomeBloc>(context).add(GetUsers());
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
                            _router.goToDetailScreen(user);
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
        ));
  }
}
