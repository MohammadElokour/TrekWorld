import 'package:flutter/material.dart';
import 'login_screen.dart';

class BrowsingScreen extends StatelessWidget {
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Browse Places',
          style: TextStyle(
            fontFamily: 'Trebuchet MS',
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Mike Adams'),
              accountEmail: Text('mike1994@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('http://bit.ly/2Kj0IIk'),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                size: 30.0,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontFamily: 'Trebuchet MS',
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
