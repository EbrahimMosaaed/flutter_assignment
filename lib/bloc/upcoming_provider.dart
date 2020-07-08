import 'package:flutter/material.dart';
import 'upcoming_bloc.dart';

class UpComingProvider extends InheritedWidget {
  final HomeBloc bloc;
  UpComingProvider({Key key, Widget child})
      : bloc = HomeBloc(),
        super(key: key, child: child);
  bool updateShouldNotify(_) => true;

  static HomeBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<UpComingProvider>())
        .bloc;
  }
}
