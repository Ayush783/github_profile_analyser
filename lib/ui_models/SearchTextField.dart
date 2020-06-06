import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget searchUser(TextEditingController controller, Function(String) function) {
  return TextField(
    controller: controller,
    onChanged: function,
    showCursor: false,
    textAlign: TextAlign.center,
    style: TextStyle(fontFamily: 'Sans'),
    decoration: InputDecoration(
      hintText: "Enter Username",
      prefixIcon: Lottie.asset('images/search.json',height: 60),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
      hintStyle: TextStyle(fontFamily: 'Sans'),
    ),
  );
}
