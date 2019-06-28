import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommentScreen extends StatefulWidget {
  final FirebaseUser userObj;
  final DocumentSnapshot database;
  CommentScreen({Key key, this.userObj, this.database}) : super(key: key);

  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  // List<String> comments = [];

  void addComment(String val) {
    List comment = ['${widget.userObj.displayName}: $val'];
    Firestore.instance.runTransaction((transaction) async {
      DocumentSnapshot freshSnap =
          await transaction.get(widget.database.reference);
      await transaction.update(freshSnap.reference, {
        'commentsList': FieldValue.arrayUnion(comment),
      });
    });
  }

  Widget buildCommentsList() {
    return ListView.builder(itemBuilder: (context, index) {
      if (index < widget.database['commentsList'].length) {
        return buildCommentItem(widget.database['commentsList'][index]);
      }
    });
  }

  Widget buildCommentItem(String comment) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
      title: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(
            color: Color(0xFFDC143C),
          ),
        ),
        child: Text(
          comment,
          style: TextStyle(
            fontFamily: 'GT Walsheim Regular',
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Comments Section',
          style: TextStyle(
            fontFamily: 'Trebuchet MS',
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: buildCommentsList(),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: TextField(
              onSubmitted: (String val) {
                addComment(val);
                // Firestore.instance.document(widget.database.documentID).get();
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Add comment',
                hintStyle: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'GT Walsheim Regular',
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  borderSide: BorderSide(color: Color(0xFFDC143C), width: 1.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
                labelStyle: TextStyle(
                  fontFamily: 'GT Walsheim Regular',
                  fontSize: 15.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
