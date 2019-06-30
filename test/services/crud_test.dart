import 'package:flutter/widgets.dart';
import 'package:trekworld/services/crud.dart';
import "package:test_api/test_api.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

//A beginners attempt to try out testing in darts/flutter.... but non the less an attempt!

void main() {
  test("crudObj.addData adds data from the user's input to the database", () {
    CrudMethods crudObj = CrudMethods();
    Firestore.instance.collection('Places').snapshots();
    AsyncSnapshot<dynamic> snapshot;
    Map placeData = {
      'name': 'placeName',
      'firstImage': '1stImg',
      'secondImage': '2ndImg',
      'thirdImage': '3rdImg',
      'info': 'PlaceInfo',
      'upVote': 0,
      'downVote': 0,
      'likedUsers': [],
      'dislikeUsers': [],
      'commentsList': []
    };
    expect(
        crudObj.addData(placeData), equals(snapshot.data.documents.length + 1));
  });
}
