import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trekworld/src/screens/browsing_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FacebookLogin fbLogin = FacebookLogin();
  GoogleSignIn googleAuth = GoogleSignIn();
  bool isLogged = false;

  void logOut() async {
    await FirebaseAuth.instance.signOut().then((responce) {
      isLogged = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          background(context),
          homeBtn(context),
          header(),
          buttons(context),
          // signIn(context),
        ],
      ),
    );
  }

  Widget background(context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Image.asset(
        'assets/images/login.jpg',
        width: size.width,
        height: size.height,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget homeBtn(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 51.0),
      child: IconButton(
        icon: Icon(Icons.chevron_left),
        iconSize: 50.0,
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/');
        },
      ),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0, left: 50.0),
      child: Text(
        'Login',
        style: TextStyle(
          fontFamily: 'Trebuchet MS',
          fontSize: 40.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buttons(context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          topSpacing(),
          googlebtn(),
          facebookBtn(),
          twitterBtn(),
        ],
      ),
    );
  }

  Widget topSpacing() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
    );
  }

  Widget facebookBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: RawMaterialButton(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 100.0),
          child: Text(
            'Facebook',
            style: TextStyle(
              fontFamily: 'Trebuchet MS',
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
        fillColor: Color(0xFF3B5998),
        splashColor: Colors.blueAccent,
        shape: const StadiumBorder(),
        onPressed: () {
          fbLogin.logInWithReadPermissions(['email', 'public_profile']).then(
              (result) {
            switch (result.status) {
              case FacebookLoginStatus.loggedIn:
                AuthCredential credential = FacebookAuthProvider.getCredential(
                    accessToken: result.accessToken.token);
                FirebaseAuth.instance
                    .signInWithCredential(credential)
                    .then((signedInUser) {
                  print('Signed in as ${signedInUser.displayName}');
                  Navigator.pushReplacementNamed(context, '/browser');
                }).catchError((e) {
                  print(e);
                });
                break;
              case FacebookLoginStatus.cancelledByUser:
                print('Facebook login cancelled by user');
                break;
              case FacebookLoginStatus.error:
                print('Facebook login error');
                break;
            }
          }).catchError((e) {
            print(e);
          });
        },
      ),
    );
  }

  Widget twitterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: RawMaterialButton(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 110.0),
          child: Text(
            'Twitter',
            style: TextStyle(
              fontFamily: 'Trebuchet MS',
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
        fillColor: Color(0xFF1DA1F2),
        splashColor: Colors.lightBlue[100],
        shape: const StadiumBorder(),
        onPressed: () {
          print('Twitter Clicked!');
        },
      ),
    );
  }

  Widget googlebtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: RawMaterialButton(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 115.0),
          child: Text(
            'Google',
            style: TextStyle(
              fontFamily: 'Trebuchet MS',
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
        fillColor: Color(0xFFDD4B39),
        splashColor: Colors.redAccent,
        shape: const StadiumBorder(),
        onPressed: () {
          googleAuth.signIn().then((result) {
            result.authentication.then((googleKey) {
              AuthCredential credential = GoogleAuthProvider.getCredential(
                  idToken: googleKey.idToken,
                  accessToken: googleKey.accessToken);
              FirebaseAuth.instance
                  .signInWithCredential(credential)
                  .then((signedInUser) {
                isLogged = true;
                print('Signed in as ${signedInUser.displayName}');
                var route = MaterialPageRoute(
                  builder: (BuildContext context) =>
                      BrowsingScreen(value: signedInUser),
                );
                Navigator.of(context).pushReplacement(route);
              }).catchError((e) {
                print(e);
              });
            }).catchError((e) {
              print(e);
            });
          }).catchError((e) {
            print(e);
          });
        },
      ),
    );
  }
}
