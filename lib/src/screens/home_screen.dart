import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Widget build(context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Center(
          child: Image.asset(
            'assets/images/background.jpg',
            width: size.width,
            height: size.height,
            fit: BoxFit.fill,
          ),
        ),
        header(),
        subHeader(),
      ],
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Text(
        'Trek World',
        style: TextStyle(
          fontFamily: 'Trebuchet MS',
          fontSize: 40.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget subHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 150.0, top: 150.0),
      child: Text(
        'Your Next Hiking Trip Starts Here!',
        style: TextStyle(
          fontFamily: 'Trebuchet MS',
          fontSize: 25.0,
          color: Colors.white,
          shadows: [
            Shadow(
                // bottomLeft
                offset: Offset(-1.0, -1.0),
                color: Colors.black),
            Shadow(
                // bottomRight
                offset: Offset(1.0, -1.0),
                color: Colors.black),
            Shadow(
                // topRight
                offset: Offset(1.0, 1.0),
                color: Colors.black),
            Shadow(
                // topLeft
                offset: Offset(-1.0, 1.0),
                color: Colors.black),
          ],
        ),
      ),
    );
  }
}
