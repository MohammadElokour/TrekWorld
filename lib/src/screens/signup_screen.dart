// import 'package:flutter/material.dart';

// class SignupScreen extends StatelessWidget {
//   Widget build(context) {
//     return Stack(
//       children: <Widget>[
//         background(context),
//         homeBtn(context),
//         header(),
//         buttons(),
//         login(context),
//       ],
//     );
//   }

//   Widget homeBtn(context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 61.0),
//       child: IconButton(
//         icon: Icon(Icons.chevron_left),
//         iconSize: 50.0,
//         onPressed: () {
//           Navigator.pushReplacementNamed(context, '/');
//         },
//       ),
//     );
//   }

//   Widget background(context) {
//     Size size = MediaQuery.of(context).size;
//     return Center(
//       child: Image.asset(
//         'assets/images/signup.jpg',
//         width: size.width,
//         height: size.height,
//         fit: BoxFit.fill,
//       ),
//     );
//   }

//   Widget header() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 70.0, left: 50.0),
//       child: Text(
//         'Sign Up',
//         style: TextStyle(
//           fontFamily: 'Trebuchet MS',
//           fontSize: 40.0,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }

// Widget buttons() {
//   return Column(
//     children: <Widget>[
//       //Facebook button:
//       Padding(
//         padding: const EdgeInsets.only(top: 290.0, left: 63.0),
//         child: RawMaterialButton(
//           child: Padding(
//             padding:
//                 const EdgeInsets.symmetric(vertical: 15.0, horizontal: 100.0),
//             child: Text(
//               'Facebook',
//               style: TextStyle(
//                 fontFamily: 'Trebuchet MS',
//                 fontSize: 20.0,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           fillColor: Color(0xFF3B5998),
//           splashColor: Colors.blueAccent,
//           shape: const StadiumBorder(),
//           onPressed: () {
//             print('Facebook Clicked!');
//           },
//         ),
//       ),
//       //-------------------------------------------------------------------------------
//       //Twitter button:
//       Padding(
//         padding: const EdgeInsets.only(top: 30.0, left: 63.0),
//         child: RawMaterialButton(
//           child: Padding(
//             padding:
//                 const EdgeInsets.symmetric(vertical: 15.0, horizontal: 110.0),
//             child: Text(
//               'Twitter',
//               style: TextStyle(
//                 fontFamily: 'Trebuchet MS',
//                 fontSize: 20.0,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           fillColor: Color(0xFF1DA1F2),
//           splashColor: Colors.lightBlue[100],
//           shape: const StadiumBorder(),
//           onPressed: () {
//             print('Twitter Clicked!');
//           },
//         ),
//       ),
//       //--------------------------------------------------------------------------
//       //Google button:
//       Padding(
//         padding: const EdgeInsets.only(top: 30.0, left: 63.0),
//         child: RawMaterialButton(
//           child: Padding(
//             padding:
//                 const EdgeInsets.symmetric(vertical: 15.0, horizontal: 115.0),
//             child: Text(
//               'Google',
//               style: TextStyle(
//                 fontFamily: 'Trebuchet MS',
//                 fontSize: 20.0,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           fillColor: Color(0xFFDD4B39),
//           splashColor: Colors.redAccent,
//           shape: const StadiumBorder(),
//           onPressed: () {
//             print('Google Clicked!');
//           },
//         ),
//       ),
//     ],
//   );
// }

// Widget login(context) {
//   return Column(
//     children: <Widget>[
//       Padding(
//         padding: const EdgeInsets.only(top: 540.0, left: 90.0),
//         child: Text(
//           'Already Have an account?',
//           style: TextStyle(
//             fontFamily: 'Trebuchet MS',
//             fontSize: 20.0,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(top: 30.0, left: 90.0),
//         child: RawMaterialButton(
//           child: Padding(
//             padding:
//                 const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
//             child: Text(
//               'Login!',
//               style: TextStyle(
//                 fontFamily: 'Trebuchet MS',
//                 fontSize: 20.0,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           fillColor: Colors.white,
//           splashColor: Colors.pink[200],
//           shape: const StadiumBorder(),
//           onPressed: () {
//             Navigator.pushReplacementNamed(context, '/login');
//           },
//         ),
//       ),
//     ],
//   );
// }
