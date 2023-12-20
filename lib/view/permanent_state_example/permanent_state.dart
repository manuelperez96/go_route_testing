import 'package:flutter/material.dart';
import 'package:go_route_testing/view/permanent_state_example/permanent_state_route.dart';

class PermanentState extends StatelessWidget {
  const PermanentState({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Material App',
      routerConfig: permanentRouter,
    );
  }
}
