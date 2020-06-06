import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Widget searchUser(TextEditingController controller, Function(String) function) {
  return TextField(
    controller: controller,
    onChanged: function,
    showCursor: false,
    textAlign: TextAlign.center,
    style: TextStyle(fontFamily: 'Sans'),
    decoration: InputDecoration(
      hintText: "Enter Username",
      prefixIcon: Icon(
        MaterialCommunityIcons.account_search_outline,
        color: Colors.grey[800],
      ),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
      hintStyle: TextStyle(fontFamily: 'Sans'),
    ),
  );
}
