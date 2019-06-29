import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trekworld/src/screens/Comments_screen.dart';

class InfoScreen extends StatefulWidget {
  final DocumentSnapshot database;
  final FirebaseUser user;
  InfoScreen({Key key, this.database, this.user}) : super(key: key);

  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.database['name']}',
          style: TextStyle(
            fontFamily: 'Trebuchet MS',
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            width: 450.0,
            height: 319.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 20.0,
                )
              ],
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 460.0,
                  child: Card(
                    color: Color(0xFFDC143C),
                    child: Wrap(
                      children: <Widget>[
                        Image.network('${widget.database['firstImage']}'),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 460.0,
                  child: Card(
                    color: Color(0xFFDC143C),
                    child: Wrap(
                      children: <Widget>[
                        Image.network('${widget.database['secondImage']}'),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 460.0,
                  child: Card(
                    color: Color(0xFFDC143C),
                    child: Wrap(
                      children: <Widget>[
                        Image.network('${widget.database['thirdImage']}'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(widget.database['upVote'].toString()),
                      Container(padding: EdgeInsets.only(left: 7.0)),
                      Icon(
                        (Icons.thumb_up),
                        size: 30.0,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(widget.database['downVote'].toString()),
                      Container(padding: EdgeInsets.only(left: 7.0)),
                      Icon(
                        (Icons.thumb_down),
                        size: 30.0,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Container(
                width: 360.0,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 20.0,
                    )
                  ],
                  color: Color(0xFFDC143C),
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
                child: Text(
                  '${widget.database['info']}',
                  style: TextStyle(
                    fontFamily: 'GT Walsheim Regular',
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(horizontal: 107.0),
            child: RawMaterialButton(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Comments',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'GT Walsheim Regular',
                    fontSize: 20.0,
                  ),
                ),
              ),
              fillColor: Colors.white,
              splashColor: Colors.grey,
              shape: StadiumBorder(
                  side: BorderSide(color: Color(0xFFDC143C), width: 2.0)),
              onPressed: () {
                var route = MaterialPageRoute(
                  builder: (BuildContext context) => CommentScreen(
                        database: widget.database,
                        userObj: widget.user,
                      ),
                );
                Navigator.of(context).push(route);
              },
            ),
          )
        ],
      ),
    );
  }
}
