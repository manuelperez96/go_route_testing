import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_route_testing/view/shared_bloc_example/bloc/user_bloc.dart';
import 'package:go_router/go_router.dart';

class SingupPage extends StatelessWidget {
  const SingupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignupPage'),
        leading: BackButton(
          onPressed: () {
            context.pop();
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () => context.read<UserBloc>().add(IncrementState()),
            child: const Icon(Icons.abc),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: null,
            onPressed: () => context.go('/signup/name'),
            child: const Icon(Icons.abc),
          ),
        ],
      ),
      body: const _ThereIsBloc(),
    );
  }
}

class _ThereIsBloc extends StatelessWidget {
  const _ThereIsBloc({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.watch<UserBloc>().state.value;

    return Center(
      child: Text('bloc : $value'),
    );
  }
}
