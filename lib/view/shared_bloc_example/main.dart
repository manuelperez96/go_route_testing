import 'package:flutter/material.dart';
import 'package:go_route_testing/view/shared_bloc_example/router_cubit.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Material App',
      routerConfig: routerBloc,
    );
  }
}
