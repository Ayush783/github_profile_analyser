import 'package:flutter/material.dart';

Widget gitButton(Function function , Widget widget) {
    return FloatingActionButton(
                  heroTag: 'git',
                  onPressed: function,
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
                  backgroundColor: Colors.black,
                );
  }