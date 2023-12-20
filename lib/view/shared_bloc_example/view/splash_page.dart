import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBloc'),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () => context.go('/signup'),
        child: const Icon(Icons.abc),
      ),
    );
  }
}
