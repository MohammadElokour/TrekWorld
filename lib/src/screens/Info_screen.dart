import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InfoScreen extends StatelessWidget {
  final DocumentSnapshot value;
  InfoScreen({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${value['name']}',
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
            height: 300.0,
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
                    child: Wrap(
                      children: <Widget>[
                        Image.network('${value['firstImage']}'),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 460.0,
                  child: Card(
                    child: Wrap(
                      children: <Widget>[
                        Image.network('${value['secondImage']}'),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 460.0,
                  child: Card(
                    child: Wrap(
                      children: <Widget>[
                        Image.network('${value['thirdImage']}'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(padding: EdgeInsets.only(right: 130.0)),
                Container(
                  child: Text(value['upVote'].toString()),
                ),
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  iconSize: 30.0,
                  splashColor: Colors.green,
                  onPressed: () {
                    Firestore.instance.runTransaction((transaction) async {
                      DocumentSnapshot freshSnap =
                          await transaction.get(value.reference);
                      await transaction.update(freshSnap.reference, {
                        'upVote': freshSnap['upVote'] + 1,
                      });
                    });
                  },
                ),
                Container(padding: EdgeInsets.only(right: 40.0)),
                Container(
                  child: Text(value['downVote'].toString()),
                ),
                IconButton(
                  icon: Icon(Icons.thumb_down),
                  iconSize: 30.0,
                  splashColor: Colors.red,
                  onPressed: () {
                    Firestore.instance.runTransaction((transaction) async {
                      DocumentSnapshot freshSnap =
                          await transaction.get(value.reference);
                      await transaction.update(freshSnap.reference, {
                        'downVote': freshSnap['downVote'] + 1,
                      });
                    });
                  },
                )
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
                  '${value['info']}',
                  style: TextStyle(
                    fontFamily: 'GT Walsheim Regular',
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
