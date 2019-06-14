import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
// import 'blocs/provider.dart';

const PrimaryColor = const Color(0xFFB10DC9);
// const TextColor = const Color(0xFFFFFFFF);

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TrekWorld',
      theme: ThemeData(
        primaryColor: PrimaryColor,
        primaryTextTheme: TextTheme(
          title: TextStyle(color: Colors.white),
        ),
      ),
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
