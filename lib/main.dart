import 'package:flutter/material.dart';
import 'package:github_profile_analyser/DataRepository/dataRepository.dart';
import 'package:github_profile_analyser/screens/SearchScreen.dart';
import 'package:github_profile_analyser/screens/splashScreen.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create:(context)=> DataRepository(),
          child: MaterialApp(
        initialRoute: 'splash',
          routes: {
            'splash': (context) => SplashScreen(),
            'search': (context) => SearchScreen()
          },
          debugShowCheckedModeBanner: false,
      ),
    );
  }
}


// Stack(
//                   alignment: Alignment.center,
//                   children: <Widget>[
//                      FloatingActionButton(
//                   onPressed: () {
//                     setState(() {
//                       _widget = SpinKitCircle(
//                         color: Colors.white,
//                         duration: Duration(milliseconds: 700),
//                         size: 30,
//                       );
//                     });
//                   },
//                   backgroundColor: Colors.black,
//                 ),
//                  AnimatedSwitcher(
//                     duration: Duration(seconds: 1),
//                     child: _widget,
//                     transitionBuilder:
//                         (Widget child, Animation<double> animation) {
//                       animation = CurvedAnimation(
//                           parent: animation, curve: Curves.elasticInOut);
//                       return ScaleTransition(
//                         alignment: Alignment.center,
//                         child: child,
//                         scale: animation,
//                       );
//                     },
//                   ),
//                   ],
//                 ),