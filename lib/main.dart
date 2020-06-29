import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_dashboard/app_them.dart';
import 'providers/app_theme_provider.dart';
import 'utils/router.dart';

void main() {
  runApp(ChangeNotifierProvider<AppThemeProvider>(
    create: (context) => AppThemeProvider(),
    child: MyApp(),
  ));
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
        themeMode: context.watch<AppThemeProvider>().isDark
            ? ThemeMode.dark
            : ThemeMode.light);
  }
}
