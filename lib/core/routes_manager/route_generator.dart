import 'package:e_commerce_app_c11/core/routes_manager/routes.dart';
import 'package:e_commerce_app_c11/features/auth/login/login_screen.dart';
import 'package:e_commerce_app_c11/features/auth/register/register_screen.dart';
import 'package:e_commerce_app_c11/features/main_layout/main_layout.dart';
import 'package:e_commerce_app_c11/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../features/main_layout/screens/cart/cart_products_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainLayout());
      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) => CartProductsScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('No Route Found'),
              ),
              body: const Center(
                child: Text('No Route Found'),
              ),
            ));
  }
}
