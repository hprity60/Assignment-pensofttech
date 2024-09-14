import 'package:assignment_app/features/home/presentation/pages/home_screen.dart';
import 'package:assignment_app/features/home/presentation/pages/product_details.dart';
import 'package:flutter/material.dart';
import '../../features/home/data/models/feature_product_model.dart';
import '../../features/sign_in/presentation/pages/sign_in_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {


      case HomeScreen.id:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case ProductDetailScreen.id:
        final link = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ProductDetailScreen(
            link: link,
          ),
        );

      default:
        return null;
    }
  }
}
