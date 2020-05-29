import 'package:flutter/material.dart';

CircleAvatar followerButton(Widget widget,Function function,double e) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: (e==3)?Colors.white:Colors.black,
          child: FloatingActionButton(
                        heroTag: 'follower',
                        onPressed: function,
                        backgroundColor: Color.fromRGBO(66, 134, 245, 1),
                        elevation: e,
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
                      ),
    );
  }