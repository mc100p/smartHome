import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smarthome/pages/homepage/homepage.dart';
import 'package:smarthome/pages/welcome/welcome.dart';
import 'package:smarthome/utils/magic_string.dart';

class RouteGenerator {
  GoRouter router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: RouteNames.welcome,
        path: '/',
        builder: (context, state) => const Welcome(),
        // pageBuilder: (context, state) {
        //   return buildPageWithDefaultTransition<void>(
        //     context: context,
        //     state: state,
        //     child: const Welcome(),
        //   );
        // },
      ),
      GoRoute(
        name: RouteNames.homepage,
        path: '/${RouteNames.homepage}',
        builder: (context, state) => const Homepage(),
        pageBuilder: (context, state) {
          return buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const Homepage(),
          );
        },
      ),
    ],
    errorBuilder: (context, state) => const ErrorRoute(),
    errorPageBuilder: (context, state) =>
        const MaterialPage(child: ErrorRoute()),
  );
}

class ErrorRoute extends StatelessWidget {
  const ErrorRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error - 400"),
        leading: IconButton(
          icon: IconButton(
            icon: Platform.isIOS
                ? const Icon(Icons.arrow_back_ios)
                : const Icon(Icons.arrow_back_outlined),
            onPressed: () => Navigator.pop(context),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Text(
          "Page Not Found....",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        ScaleTransition(scale: animation, child: child),
  );
}
