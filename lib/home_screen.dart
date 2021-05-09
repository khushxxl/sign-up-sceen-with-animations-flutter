import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(
      {@required this.name,
      @required this.email,
      @required this.phone,
      @required this.password});

  final name;
  final email;
  final phone;
  final password;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF62A4F2),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(FontAwesomeIcons.timesCircle),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Column(
              children: [
                Text("Hello, " + widget.name),
                Text("Your email is , " + widget.email),
                Text("Your phone number is , " + widget.phone),
                Text("Your password is " + widget.password),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
