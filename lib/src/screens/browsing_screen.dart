import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:trekworld/src/screens/Info_screen.dart';
import '../../services/crud.dart';

class BrowsingScreen extends StatefulWidget {
  final FirebaseUser value;

  BrowsingScreen({Key key, this.value}) : super(key: key);

  _BrowsingScreenState createState() => _BrowsingScreenState();
}

class _BrowsingScreenState extends State<BrowsingScreen> {
  String name;
  String firstImage;
  String secondImage;
  String thridImage;
  String info;

  CrudMethods crudObj = CrudMethods();

  Future<bool> addDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'New Place',
              style: TextStyle(
                fontFamily: 'Trebuchet MS',
                fontSize: 18.0,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            contentPadding: EdgeInsets.all(10.0),
            contentTextStyle: TextStyle(fontFamily: 'GT Walsheim Regular'),
            content: Column(
              children: <Widget>[
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10, left: 10),
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter place name',
                              icon: Icon(Icons.place),
                            ),
                            onChanged: (value) {
                              this.name = value;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10, left: 10),
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter 1st Image URL',
                              icon: Icon(Icons.add_to_photos),
                            ),
                            onChanged: (value) {
                              this.firstImage = value;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10, left: 10),
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter 2nd Image URL',
                              icon: Icon(Icons.add_to_photos),
                            ),
                            onChanged: (value) {
                              this.secondImage = value;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10, left: 10),
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter 3rd Image URL',
                              icon: Icon(Icons.add_to_photos),
                            ),
                            onChanged: (value) {
                              this.thridImage = value;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10, left: 10),
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter a paragraph about the place',
                              icon: Icon(Icons.info),
                            ),
                            onChanged: (value) {
                              this.info = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'Add',
                  style: TextStyle(
                    fontFamily: 'GT Walsheim Regular',
                  ),
                ),
                textColor: Colors.blue,
                splashColor: Colors.blueAccent,
                onPressed: () {
                  Navigator.of(context).pop();
                  Map placeData = {
                    'name': this.name,
                    'firstImage': this.firstImage,
                    'secondImage': this.secondImage,
                    'thirdImage': this.thridImage,
                    'info': this.info,
                    'upVote': 0,
                    'downVote': 0
                  };
                  crudObj.addData(placeData).then((result) {
                    dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                },
              )
            ],
          );
        });
  }

  Future<bool> dialogTrigger(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Place Added!',
            style: TextStyle(
              fontFamily: 'Trebuchet MS',
              fontSize: 20.0,
            ),
          ),
          content: Text(
            'Your Place Has been added Successfully',
            style: TextStyle(
              fontFamily: 'GT Walsheim Regular',
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Alright',
                style: TextStyle(
                  fontFamily: 'GT Walsheim Regular',
                ),
              ),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
      floatingActionButton: Container(
        height: 65.5,
        width: 65.5,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Color(0xFFDC143C),
            child: Icon(Icons.add_photo_alternate),
            onPressed: () {
              addDialog(context);
            },
          ),
        ),
      ),
    );
  }
}
