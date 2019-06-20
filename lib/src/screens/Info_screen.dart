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
            padding: EdgeInsets.all(15.0),
            width: 450.0,
            height: 300.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Image.network('${value['firstImage']}'),
                Image.network('${value['secondImage']}'),
                Image.network('${value['thirdImage']}'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Container(
                width: 375.0,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
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
