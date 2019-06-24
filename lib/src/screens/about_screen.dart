import 'package:flutter/material.dart';
import '../../services/crud.dart';

class AboutScreen extends StatelessWidget {
  final CrudMethods crudObj = CrudMethods();

  Widget build(context) {
    return Stack(
      children: <Widget>[
        background(context),
        homeBtn(context),
        header(),
      ],
    );
  }

  Widget homeBtn(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 61.0),
      child: IconButton(
        icon: Icon(Icons.chevron_left),
        iconSize: 50.0,
        onPressed: () {
          if (crudObj.isLoggedIn()) {
            Navigator.pushNamed(context, '/');
          }
        },
      ),
    );
  }

  Widget background(context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Image.asset(
        'assets/images/signup.jpg',
        width: size.width,
        height: size.height,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.only(top: 70.0, left: 50.0),
      child: Text(
        'About:',
        style: TextStyle(
          fontFamily: 'Trebuchet MS',
          fontSize: 40.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
