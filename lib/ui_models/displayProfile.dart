import 'package:flutter/material.dart';

Widget dp(String url){
 return Material(
                      borderRadius: BorderRadius.circular(60),
                      elevation: 20,
                      shadowColor: Colors.red,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60,
                        child: CircleAvatar(
                          radius: 57,
                          backgroundImage:
                              NetworkImage(url),
                        ),
                      ),
                    );
}