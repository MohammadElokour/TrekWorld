import 'package:flutter/material.dart';
import 'package:trekworld/src/screens/Info_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/browsing_screen.dart';
import 'screens/Info_screen.dart';
import 'screens/about_screen.dart';

const PrimaryColor = const Color(0xFFDC143C);

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TrekWorld',
      theme: ThemeData(
        primaryColor: PrimaryColor,
        primaryTextTheme: TextTheme(
          title: TextStyle(color: Colors.white),
        ),
      ),
      onGenerateRoute: routes,
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            body: HomeScreen(),
          );
        },
      );
    } else if (settings.name == '/login') {
      return MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            body: LoginScreen(),
          );
        },
      );
    } else if (settings.name == '/browser') {
      return MaterialPageRoute(
        builder: (context) {
          return BrowsingScreen();
        },
      );
    } else if (settings.name == '/info') {
      return MaterialPageRoute(
        builder: (context) {
          return InfoScreen();
        },
      );
    } else if (settings.name == '/about') {
      return MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            body: AboutScreen(),
          );
        },
      );
    }
  }
}
