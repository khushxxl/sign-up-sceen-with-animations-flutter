import 'package:flutter/material.dart';
import 'package:login_screen_flutter/home_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'myTextField.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool changedButton = false;

  final _formKey = GlobalKey<FormState>();

  final _myControllerName = TextEditingController();
  final _myControllerEmail = TextEditingController();
  final _myControllerPhone = TextEditingController();
  final _myControllerPassword = TextEditingController();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        changedButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      Navigator.push(
        context,
        ScaleRoute(
          page: HomeScreen(
            name: _myControllerName.text,
            email: _myControllerEmail.text,
            phone: _myControllerPhone.text,
            password: _myControllerPassword.text,
          ),
        ),
      );

      await Future.delayed(Duration(seconds: 2));
      setState(() {
        changedButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF62A4F2),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MyTextField(
                    textType: TextInputType.name,
                    hideText: false,
                    controllerKey: _myControllerName,
                    userValue: "Full Name",
                    hintText: "Enter full name",
                    icon: FontAwesomeIcons.userNinja,
                  ),
                  MyTextField(
                    textType: TextInputType.emailAddress,
                    controllerKey: _myControllerEmail,
                    hideText: false,
                    userValue: "Email-id",
                    hintText: "Enter your valid email id",
                    icon: FontAwesomeIcons.envelope,
                  ),
                  MyTextField(
                    textType: TextInputType.number,
                    controllerKey: _myControllerPhone,
                    hideText: false,
                    userValue: "Phone Number",
                    hintText: "Enter your phone no.",
                    icon: FontAwesomeIcons.mobile,
                  ),
                  MyTextField(
                    textType: TextInputType.visiblePassword,
                    controllerKey: _myControllerPassword,
                    hideText: true,
                    userValue: "Password",
                    hintText: "Enter Password",
                    icon: FontAwesomeIcons.key,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      moveToHome(context);
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: 50.0,
                      width: changedButton ? 50 : 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(changedButton ? 50.0 : 20.0),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: changedButton
                            ? SpinKitCircle(
                                color: Colors.black,
                              )
                            : Text("Register Now ",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}
