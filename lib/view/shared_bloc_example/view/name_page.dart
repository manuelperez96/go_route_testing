import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc.dart';

class NamePage extends StatelessWidget {
  const NamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBloc'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.abc),
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
