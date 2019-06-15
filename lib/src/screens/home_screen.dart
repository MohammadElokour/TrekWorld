import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Widget build(context) {
    return Stack(
      children: <Widget>[
        background(context),
        header(),
        subHeader(),
        login(context),
      ],
    );
  }

  Widget background(context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Image.asset(
        'assets/images/background.jpg',
        width: size.width,
        height: size.height,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget login(context) {
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
        fillColor: Colors.deepOrangeAccent,
        splashColor: Colors.orangeAccent,
        shape: const StadiumBorder(),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/login');
        },
      ),
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
                color: Colors.brown),
            Shadow(
                // bottomRight
                offset: Offset(1.0, -1.0),
                color: Colors.brown),
            Shadow(
                // topRight
                offset: Offset(1.0, 1.0),
                color: Colors.brown),
            Shadow(
                // topLeft
                offset: Offset(-1.0, 1.0),
                color: Colors.brown),
          ],
        ),
      ),
    );
  }
}
