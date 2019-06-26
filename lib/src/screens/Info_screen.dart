import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InfoScreen extends StatelessWidget {
  final DocumentSnapshot value;
  final FirebaseUser user;
  InfoScreen({Key key, this.value, this.user}) : super(key: key);

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
                        Image.network('${value['firstImage']}'),
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
                        Image.network('${value['secondImage']}'),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(value['upVote'].toString()),
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
                    Text(value['downVote'].toString()),
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

// Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
//   return ListTile(
//     title: Stack(
//       children: <Widget>[
//         Container(
//           padding: EdgeInsets.only(top: 290.0),
//           child: Row(
//             children: <Widget>[
//               Container(padding: EdgeInsets.only(right: 110.0)),
//               Container(
//                 child: Text(document['upVote'].toString()),
//               ),
//               IconButton(
//                 icon: Icon(Icons.thumb_up),
//                 iconSize: 30.0,
//                 splashColor: Colors.green,
//                 onPressed: () {
//                   bool isLiked = false;
//                   List currentUser = ['${widget.value.email}'];
//                   for (var i = 0; i < document['dislikeUsers'].length; i++) {
//                     if (document['dislikeUsers'][i] ==
//                         '${widget.value.email}') {
//                       Firestore.instance.runTransaction((transaction) async {
//                         DocumentSnapshot freshSnap =
//                             await transaction.get(document.reference);
//                         await transaction.update(freshSnap.reference, {
//                           'dislikeUsers': FieldValue.arrayRemove(currentUser),
//                           'downVote': freshSnap['downVote'] - 1,
//                         });
//                       });
//                     }
//                   }
//                   for (var i = 0; i < document['likedUsers'].length; i++) {
//                     if (document['likedUsers'][i] == '${widget.value.email}') {
//                       isLiked = true;
//                     }
//                   }
//                   for (var i = 0; i < document['likedUsers'].length; i++) {
//                     if (isLiked) {
//                       Firestore.instance.runTransaction((transaction) async {
//                         DocumentSnapshot freshSnap =
//                             await transaction.get(document.reference);
//                         await transaction.update(freshSnap.reference, {
//                           'likedUsers': FieldValue.arrayRemove(currentUser),
//                           'upVote': freshSnap['upVote'] - 1
//                         });
//                       });
//                     }
//                   }
//                   if (!isLiked) {
//                     Firestore.instance.runTransaction((transaction) async {
//                       DocumentSnapshot freshSnap =
//                           await transaction.get(document.reference);
//                       await transaction.update(freshSnap.reference, {
//                         'likedUsers': FieldValue.arrayUnion(currentUser),
//                         'upVote': freshSnap['upVote'] + 1
//                       });
//                     });
//                   }
//                 },
//               ),
//               Container(padding: EdgeInsets.only(right: 40.0)),
//               Container(
//                 child: Text(document['downVote'].toString()),
//               ),
//               IconButton(
//                 icon: Icon(Icons.thumb_down),
//                 iconSize: 30.0,
//                 splashColor: Colors.red,
//                 onPressed: () {
//                   bool isDisliked = false;
//                   List currentUser = ['${widget.value.email}'];

//                   for (var i = 0; i < document['likedUsers'].length; i++) {
//                     if (document['likedUsers'][i] == '${widget.value.email}') {
//                       Firestore.instance.runTransaction((transaction) async {
//                         DocumentSnapshot freshSnap =
//                             await transaction.get(document.reference);
//                         await transaction.update(freshSnap.reference, {
//                           'likedUsers': FieldValue.arrayRemove(currentUser),
//                           'upVote': freshSnap['upVote'] - 1,
//                         });
//                       });
//                     }
//                   }

//                   for (var i = 0; i < document['dislikeUsers'].length; i++) {
//                     if (document['dislikeUsers'][i] ==
//                         '${widget.value.email}') {
//                       isDisliked = true;
//                     }
//                   }
//                   for (var i = 0; i < document['dislikeUsers'].length; i++) {
//                     if (isDisliked) {
//                       Firestore.instance.runTransaction((transaction) async {
//                         DocumentSnapshot freshSnap =
//                             await transaction.get(document.reference);
//                         await transaction.update(freshSnap.reference, {
//                           'dislikeUsers': FieldValue.arrayRemove(currentUser),
//                           'downVote': freshSnap['downVote'] - 1
//                         });
//                       });
//                     }
//                   }
//                   if (!isDisliked) {
//                     Firestore.instance.runTransaction((transaction) async {
//                       DocumentSnapshot freshSnap =
//                           await transaction.get(document.reference);
//                       await transaction.update(freshSnap.reference, {
//                         'dislikeUsers': FieldValue.arrayUnion(currentUser),
//                         'downVote': freshSnap['downVote'] + 1
//                       });
//                     });
//                   }
//                 },
//               )
//             ],
//           ),
//         ),
//       ],
//     ),
//     onTap: () {},
//   );
// }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text(
//         'Explore',
//         style: TextStyle(
//           fontFamily: 'Trebuchet MS',
//           fontSize: 20.0,
//           color: Colors.white,
//         ),
//       ),
//     ),
//     body: StreamBuilder(
//       stream: Firestore.instance.collection('Places').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) return CircularProgressIndicator();
//         return ListView.builder(
//           itemCount: snapshot.data.documents.length,
//           itemBuilder: (context, index) =>
//               _buildListItem(context, snapshot.data.documents[index]),
//         );
//       },
//     ),
//   );
// }
