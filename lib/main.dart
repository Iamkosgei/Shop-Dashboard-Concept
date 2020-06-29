import 'package:flutter/material.dart';
import 'package:shop_dashboard/app_them.dart';
import 'utils/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        onGenerateRoute: Router.generateRoute,
        initialRoute: '/',
        theme: MyAppTheme.lightTheme,
        darkTheme: MyAppTheme.darkTheme,
        themeMode: ThemeMode.light);
  }
}
