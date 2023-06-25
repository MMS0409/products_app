import 'package:bottom_navigators/ui/products_about.dart';
import 'package:flutter/material.dart';
import '../ui/bottom_navi.dart';
import '../ui/login_page.dart';
import '../ui/products.dart';

class RoutesNames{
  static const String home = "/";
  static const String login = "/login";
  static const String products = "/products";
  static const String productAbout = "/product_about";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesNames.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesNames.products:
        return MaterialPageRoute(builder: (context) => const ProductsScreen());
      case RoutesNames.productAbout:
        return MaterialPageRoute(builder: (context) => ProductAbout(about: settings.arguments as List<dynamic>));
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold(
          body: Center(child: Text("Route mavjud emas"),),));
    }
  }
}