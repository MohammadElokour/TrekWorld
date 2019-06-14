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
        login(),
      ],
    );
  }

  Widget login() {
    return Padding(
      padding: const EdgeInsets.only(left: 305.0, top: 660.0),
      child: RawMaterialButton(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 21.0),
          child: Text(
            'Login',
            style: TextStyle(
              fontFamily: 'Trebuchet MS',
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
        fillColor: Colors.brown[700],
        splashColor: Colors.blueAccent,
        shape: const StadiumBorder(),
        onPressed: () {
          print('tapped');
        },
      ),
    );
  }

  // Widget login() {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 307.0, top: 650.0),
  //     child: FloatingActionButton(
  //       child: Text('Login'),
  //       onPressed: () {},
  //     ),
  //   );
  // }

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
