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
          ),
          Container(
            padding: EdgeInsets.only(top: 290.0),
            child: Row(
              children: <Widget>[
                Container(padding: EdgeInsets.only(right: 110.0)),
                Container(
                  child: Text(document['upVote'].toString()),
                ),
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  iconSize: 30.0,
                  splashColor: Colors.green,
                  onPressed: () {
                    Firestore.instance.runTransaction((transaction) async {
                      DocumentSnapshot freshSnap =
                          await transaction.get(document.reference);
                      await transaction.update(freshSnap.reference, {
                        'upVote': freshSnap['upVote'] + 1,
                      });
                    });
                  },
                ),
                Container(padding: EdgeInsets.only(right: 40.0)),
                Container(
                  child: Text(document['downVote'].toString()),
                ),
                IconButton(
                  icon: Icon(Icons.thumb_down),
                  iconSize: 30.0,
                  splashColor: Colors.red,
                  onPressed: () {
                    Firestore.instance.runTransaction((transaction) async {
                      DocumentSnapshot freshSnap =
                          await transaction.get(document.reference);
                      await transaction.update(freshSnap.reference, {
                        'downVote': freshSnap['downVote'] + 1,
                      });
                    });
                  },
                )
              ],
            ),
          ),
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
          if (!snapshot.hasData) return CircularProgressIndicator();
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
