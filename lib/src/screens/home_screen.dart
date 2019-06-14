import 'package:flutter/material.dart';
import 'package:trekworld/src/app.dart';

class HomeScreen extends StatelessWidget {
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        image:
            DecorationImage(image: AssetImage('assets/images/background.jpg')),
      ),
    );
  }

  // Widget appBar() {
  //   return AppBar(
  //     leading: Icon(Icons.home),
  //     title: Text('Trek World'),
  //     backgroundColor: PrimaryColor,
  //   );
  // }
}
