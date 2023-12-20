import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routeNav = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/a',
  debugLogDiagnostics: true,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return NavPage(widget: child);
      },
      routes: [
        GoRoute(
          path: '/a',
          builder: (context, state) => const PageA(),
        ),
        GoRoute(
          path: '/b',
          builder: (context, state) => const PageB(),
          routes: [
            GoRoute(
              path: 'setting',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const Setting(),
            ),
          ],
        ),
        GoRoute(
          path: '/c',
          builder: (context, state) => const PageC(),
          routes: [
            GoRoute(
              path: 'd',
              builder: (context, state) => const PageD(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class NavExamplePage extends StatelessWidget {
  const NavExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routeNav,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class NavPage extends StatefulWidget {
  const NavPage({super.key, required this.widget});

  final Widget widget;

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => _updateScreen(context, index),
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bolt),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_down),
            label: '',
          ),
        ],
      ),
    );
  }

  void _updateScreen(BuildContext context, int value) {
    setState(() {
      _index = value;
    });
    if (value == 0) {
      GoRouter.of(context).go('/a');
    } else if (value == 1) {
      GoRouter.of(context).go('/b');
    } else {
      GoRouter.of(context).go('/c');
    }
  }
}

class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page a'),
      ),
    );
  }
}

class PageB extends StatelessWidget {
  const PageB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page b'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/b/setting'),
        child: const Icon(Icons.reddit),
      ),
    );
  }
}

class PageC extends StatelessWidget {
  const PageC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page c'),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('$index'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/c/d'),
        child: const Icon(Icons.follow_the_signs),
      ),
    );
  }
}

class PageD extends StatelessWidget {
  const PageD({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page d'),
      ),
    );
  }
}

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
    );
  }
}
