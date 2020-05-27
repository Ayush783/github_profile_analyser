import 'package:flutter/material.dart';

FloatingActionButton gmailButton(Function function, Widget widget) {
  return FloatingActionButton(
    onPressed: function,
    heroTag: 'gmail',
    child: AnimatedSwitcher(
      duration: Duration(seconds: 2),
      child: widget,
      transitionBuilder: (Widget child, Animation<double> animation) {
        animation =
            CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
        return ScaleTransition(
          alignment: Alignment.center,
          child: child,
          scale: animation,
        );
      },
    ),
    backgroundColor: Colors.red,
  );
}
