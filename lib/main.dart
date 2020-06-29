import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.notoSansTextTheme()),
    );
  }
}
