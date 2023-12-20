import 'package:flutter/material.dart';
import 'package:go_route_testing/view/normal_example/router.dart';
import 'package:go_route_testing/view/nav_example/nav_example.dart';
import 'package:go_router/go_router.dart';

var isLogin = false;

void main() {
  runApp(const NavExamplePage());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
