import 'package:flutter/material.dart';

CircleAvatar repoButton(Widget widget, Function function,double e) {
  Future waitTime() async{
    return await Future.delayed(Duration(seconds: 1));
  }

  return CircleAvatar(
    radius: 30,
    backgroundColor: (e==3)?Colors.transparent:Color.fromRGBO(51, 51, 51, 1),
      child: FloatingActionButton(
      heroTag: 'repo',
      onPressed: function,
      backgroundColor: Color.fromRGBO(234, 66, 53, 1),
      elevation: e,
      child: AnimatedSwitcher(
        duration: Duration(seconds: 1),
        child: widget,
        transitionBuilder: (Widget child, Animation<double> animation) {
          animation =
              CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
          waitTime();
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
