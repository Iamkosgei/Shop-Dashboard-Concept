import 'package:flutter/material.dart';
import 'package:shop_dashboard/screens/home_page.dart';
import 'package:shop_dashboard/screens/orders_page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/orders':
        return MaterialPageRoute(builder: (_) => OrdersPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
