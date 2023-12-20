import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () => context.go('/home/setting'),
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
