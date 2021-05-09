import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    this.controllerKey,
    this.hintText,
    this.userValue,
    this.icon,
    this.hideText,
    this.textType,
  });

  final TextEditingController controllerKey;
  final IconData icon;
  final String userValue;
  final String hintText;
  final bool hideText;
  final TextInputType textType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 32.0),
      child: TextFormField(
        controller: controllerKey,
        validator: (value) {
          if (value.isEmpty) {
            return "This field cannot be empty";
          } else {
            return null;
          }
        },
        keyboardType: textType,
        obscureText: hideText,
        decoration: InputDecoration(
          labelText: (userValue),
          labelStyle: TextStyle(color: Colors.white, fontSize: 15.0),
          hintText: (hintText),
          hintStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
