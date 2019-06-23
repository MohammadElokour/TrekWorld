import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods {
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addData(placeData) async {
    if (isLoggedIn()) {
      Firestore.instance.collection('Places').add(placeData).catchError((e) {
        print(e);
      });
    } else {
      print('You need to be logged in');
    }
  }
}
