// import 'package:flutter/material.dart';

// import 'package:login_screen_flutter/home_screen.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool changedButton = false;

//   final _formKey = GlobalKey<FormState>();

//   final _myControllerName = TextEditingController();
//   final _myControllerAge = TextEditingController();

//   moveToHome(BuildContext context) async {
//     if (_formKey.currentState.validate()) {
//       setState(() {
//         changedButton = true;
//       });

//       await Future.delayed(Duration(seconds: 1));
//       Navigator.push(
//         context,
//         ScaleRoute(
//           page: HomeScreen(
//             name: _myControllerName.text,
//             age: _myControllerAge.text,
//           ),
//         ),
//       );

//       await Future.delayed(Duration(seconds: 2));
//       setState(() {
//         changedButton = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF62A4F2),
//       body: Center(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Sign Up",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 30.0,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                     left: 32.0, right: 32.0, bottom: 32.0),
//                 child: TextFormField(
//                   controller: _myControllerName,
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return "This field cannot be empty";
//                     } else {
//                       return null;
//                     }
//                   },
//                   decoration: InputDecoration(
//                     labelText: ("Full Name"),
//                     labelStyle: TextStyle(color: Colors.white, fontSize: 15.0),
//                     hintText: ("Enter Full Name"),
//                     hintStyle: TextStyle(color: Colors.black),
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                     prefixIcon: Icon(
//                       FontAwesomeIcons.userNinja,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 50.0,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   moveToHome(context);
//                 },
//                 child: AnimatedContainer(
//                   duration: Duration(seconds: 1),
//                   height: 50.0,
//                   width: changedButton ? 50 : 300,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius:
//                         BorderRadius.circular(changedButton ? 50.0 : 20.0),
//                   ),
//                   child: Align(
//                     alignment: Alignment.center,
//                     child: changedButton
//                         ? SpinKitCircle(
//                             color: Colors.black,
//                           )
//                         : Text("Register Now ",
//                             style: TextStyle(
//                                 fontSize: 20.0, fontWeight: FontWeight.bold),
//                             textAlign: TextAlign.center),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ScaleRoute extends PageRouteBuilder {
//   final Widget page;
//   ScaleRoute({this.page})
//       : super(
//           pageBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//           ) =>
//               page,
//           transitionsBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//             Widget child,
//           ) =>
//               ScaleTransition(
//             scale: Tween<double>(
//               begin: 0.0,
//               end: 1.0,
//             ).animate(
//               CurvedAnimation(
//                 parent: animation,
//                 curve: Curves.fastOutSlowIn,
//               ),
//             ),
//             child: child,
//           ),
//         );
// }

// // TextFormFieldCustom(
// //     hideText: false,
// //     hint: "Enter your phone no.",
// //     icon: FontAwesomeIcons.mobile,
// //     label: "Phone Number"),
// // TextFormFieldCustom(
// //     hideText: false,
// //     hint: "Enter your email id ",
// //     icon: FontAwesomeIcons.envelope,
// //     label: "Email-id"),
// // TextFormFieldCustom(
// //   hideText: true,
// //   hint: "Enter Password",
// //   icon: FontAwesomeIcons.key,
// //   label: "Password",
// // ),
