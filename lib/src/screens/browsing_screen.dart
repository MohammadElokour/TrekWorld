import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trekworld/src/screens/Info_screen.dart';

class BrowsingScreen extends StatefulWidget {
  final FirebaseUser value;

  BrowsingScreen({Key key, this.value}) : super(key: key);

  _BrowsingScreenState createState() => _BrowsingScreenState();
}

class _BrowsingScreenState extends State<BrowsingScreen> {
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0),
            width: 400.0,
            height: 275.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Color(0xFFDC143C),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 7.0,
                  )
                ]),
            child: Image.network(
              document['firstImage'],
              width: 350.0,
              height: 245.0,
            ),
          ),
          Padding(
            child: Text(
              document['name'],
              style: TextStyle(
                fontFamily: 'Trebuchet MS',
                fontSize: 21.0,
                color: Colors.white,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 35.0, horizontal: 115.0),
          )
        ],
      ),
      onTap: () {
        var route = MaterialPageRoute(
          builder: (BuildContext context) => InfoScreen(
                value: document,
              ),
        );
        Navigator.of(context).push(route);
      },
    );
  }

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
              },
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('Places').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) =>
                _buildListItem(context, snapshot.data.documents[index]),
          );
        },
      ),
    );
  }
}
