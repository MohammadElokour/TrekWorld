import 'dart:async';
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

  void logOut() async {
    await FirebaseAuth.instance.signOut().then((_) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil("/", ModalRoute.withName("/browser"));
    });
  }

  Future<bool> addDialog(BuildContext context) async {
    return showDialog(
        context: context,
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
                    fontSize: 17.0,
                    fontFamily: 'GT Walsheim Regular',
                  ),
                ),
                textColor: Color(0xFFDC143C),
                splashColor: Colors.grey,
                onPressed: () {
                  if (this.name == null ||
                      this.firstImage == null ||
                      this.secondImage == null ||
                      this.info == null) {
                    return null;
                  } else {
                    Navigator.of(context).pop();
                    Map<String, dynamic> placeData = {
                      'name': this.name,
                      'firstImage': this.firstImage,
                      'secondImage': this.secondImage,
                      'thirdImage': this.thridImage,
                      'info': this.info,
                      'upVote': 0,
                      'downVote': 0,
                      'likedUsers': [],
                      'dislikeUsers': [],
                      'commentsList': []
                    };
                    crudObj.addData(placeData).then((result) {
                      dialogTrigger(context);
                    }).catchError((e) {
                      print(e);
                    });
                  }
                },
              ),
            ],
          );
        });
  }

  Future<bool> dialogTrigger(BuildContext context) async {
    return showDialog(
      context: context,
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
        );
      },
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
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
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.network(
                  document['firstImage'],
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 210.0),
                  child: Text(
                    document['name'],
                    style: TextStyle(
                      fontFamily: 'Trebuchet MS',
                      fontSize: 21.0,
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
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 320.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(document['upVote'].toString()),
                      IconButton(
                        icon: Icon(Icons.thumb_up),
                        iconSize: 30.0,
                        splashColor: Colors.grey,
                        onPressed: () {
                          bool isLiked = false;
                          List currentUser = ['${widget.value.email}'];
                          for (var i = 0;
                              i < document['likedUsers'].length;
                              i++) {
                            if (document['likedUsers'][i] ==
                                '${widget.value.email}') {
                              isLiked = true;
                            }
                          }
                          for (var i = 0;
                              i < document['likedUsers'].length;
                              i++) {
                            if (isLiked) {
                              Firestore.instance
                                  .runTransaction((transaction) async {
                                DocumentSnapshot freshSnap =
                                    await transaction.get(document.reference);
                                await transaction.update(freshSnap.reference, {
                                  'likedUsers':
                                      FieldValue.arrayRemove(currentUser),
                                  'upVote': freshSnap['upVote'] - 1
                                });
                              });
                            }
                          }
                          if (!isLiked) {
                            Firestore.instance
                                .runTransaction((transaction) async {
                              DocumentSnapshot freshSnap =
                                  await transaction.get(document.reference);
                              await transaction.update(freshSnap.reference, {
                                'likedUsers':
                                    FieldValue.arrayUnion(currentUser),
                                'upVote': freshSnap['upVote'] + 1
                              });
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(document['downVote'].toString()),
                      IconButton(
                        icon: Icon(Icons.thumb_down),
                        iconSize: 30.0,
                        splashColor: Colors.grey,
                        onPressed: () {
                          bool isDisliked = false;
                          List currentUser = ['${widget.value.email}'];

                          for (var i = 0;
                              i < document['dislikeUsers'].length;
                              i++) {
                            if (document['dislikeUsers'][i] ==
                                '${widget.value.email}') {
                              isDisliked = true;
                            }
                          }
                          for (var i = 0;
                              i < document['dislikeUsers'].length;
                              i++) {
                            if (isDisliked) {
                              Firestore.instance
                                  .runTransaction((transaction) async {
                                DocumentSnapshot freshSnap =
                                    await transaction.get(document.reference);
                                await transaction.update(freshSnap.reference, {
                                  'dislikeUsers':
                                      FieldValue.arrayRemove(currentUser),
                                  'downVote': freshSnap['downVote'] - 1
                                });
                              });
                            }
                          }
                          if (!isDisliked) {
                            Firestore.instance
                                .runTransaction((transaction) async {
                              DocumentSnapshot freshSnap =
                                  await transaction.get(document.reference);
                              await transaction.update(freshSnap.reference, {
                                'dislikeUsers':
                                    FieldValue.arrayUnion(currentUser),
                                'downVote': freshSnap['downVote'] + 1
                              });
                            });
                          }
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      onTap: () {
        var route = MaterialPageRoute(
          builder: (BuildContext context) => InfoScreen(
                database: document,
                user: widget.value,
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
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),
            onPressed: () {},
          ),
        ],
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
              onTap: logOut,
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
            child: Icon(
              Icons.add,
              size: 35.0,
            ),
            onPressed: () {
              addDialog(context);
            },
          ),
        ),
      ),
    );
  }
}
