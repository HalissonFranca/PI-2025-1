import 'package:flutter/material.dart';

class FieldForme extends StatelessWidget {
  String label;
  bool isPassword;
  TextEditingController controller;

  FieldForme({
    required this.label,
    required this.isPassword,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: this.isPassword,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
      ),
    );
  }
}
