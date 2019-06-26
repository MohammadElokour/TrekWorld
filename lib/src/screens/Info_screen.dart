import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
                      IconButton(
                        icon: Icon(Icons.thumb_up),
                        iconSize: 30.0,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text(widget.database['downVote'].toString()),
                    IconButton(
                      icon: Icon(Icons.thumb_down),
                      iconSize: 30.0,
                      onPressed: () {},
                    )
                  ],
                )),
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
            child: Column(
              children: <Widget>[
                Text(
                  'Comments',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'GT Walsheim Regular',
                    fontSize: 22.0,
                  ),
                ),
                TextField()
              ],
            ),
          )
        ],
      ),
    );
  }
}
