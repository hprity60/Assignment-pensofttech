import 'package:assignment_app/core/routes/app_router.dart';
import 'package:assignment_app/features/sign_in/presentation/pages/sign_in_screen.dart';
import 'package:flutter/material.dart';

import 'features/home/presentation/pages/home_screen.dart';

class App extends StatelessWidget {
  App({required this.appRouter, super.key});

  AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: HomeScreen.id,
        onGenerateRoute: appRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false
    );
  }
}
