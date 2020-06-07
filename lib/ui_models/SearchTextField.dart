import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget searchUser(TextEditingController controller, Function(String) function,{String hint = "Enter Username", double height = 60}) {
  return TextField(
    controller: controller,
    onSubmitted: function,
    showCursor: false,
    textAlign: TextAlign.center,
    style: TextStyle(fontFamily: 'Sans'),
    decoration: InputDecoration(
      hintText: hint,
      prefixIcon: Lottie.asset('images/search.json',height: height),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
      hintStyle: TextStyle(fontFamily: 'Sans'),
    ),
  );
}
