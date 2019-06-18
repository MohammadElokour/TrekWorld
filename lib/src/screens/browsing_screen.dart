import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BrowsingScreen extends StatefulWidget {
  final FirebaseUser value;

  BrowsingScreen({Key key, this.value}) : super(key: key);

  _BrowsingScreenState createState() => _BrowsingScreenState();
}

class _BrowsingScreenState extends State<BrowsingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Explore',
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
              accountName: Text('${widget.value.displayName}'),
              accountEmail: Text('${widget.value.email}'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('${widget.value.photoUrl}'),
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
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/');
                }),
          ],
        ),
      ),
    );
  }
}
