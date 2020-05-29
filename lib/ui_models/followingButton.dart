import 'package:flutter/material.dart';

CircleAvatar followingButton(Widget widget , Function function,double e) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: (e==3)?Colors.transparent:Color.fromRGBO(51, 51, 51, 1),
          child: FloatingActionButton(
                        heroTag: 'following',
                        onPressed: function,
                        backgroundColor: Color.fromRGBO(16, 157, 88, 1),
                        elevation: e,
                        child: AnimatedSwitcher(
                      duration: Duration(seconds: 1),
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
                      ),
    );
  }