import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Widget searchUser(Function(String) function){
  return TextField(
    onChanged: function,
                  showCursor: false,
                  style: TextStyle(fontFamily: 'Sans'),
                  decoration: InputDecoration(
                    hintText: "Enter Username",
                    prefixIcon: Icon(
                      MaterialCommunityIcons.account_search,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide(
                        width: 1.3,
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide(
                        width: 1.3,
                        color: Colors.black,
                      ),
                    ),
                    hintStyle: TextStyle(fontFamily: 'Sans'),
                  ),
                );
}