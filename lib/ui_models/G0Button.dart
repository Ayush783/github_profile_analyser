import 'package:flutter/material.dart';

Widget goButton({Function function , Widget widget}){
  return FloatingActionButton(
                  onPressed: function,
                  backgroundColor: Colors.black,
                  child: AnimatedSwitcher(
                    duration: Duration(seconds: 2),
                    child: widget,
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      animation = CurvedAnimation(
                          parent: animation, curve: Curves.elasticInOut);
                      return ScaleTransition(
                        alignment: Alignment.center,
                        child: child,
                        scale: animation,
                      );
                    },
                  ),
                );
}