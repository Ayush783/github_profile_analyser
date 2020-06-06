import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_profile_analyser/DataRepository/dataRepository.dart';
import 'package:github_profile_analyser/screens/SearchScreen.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      SystemUiOverlayStyle(systemNavigationBarColor: Color(0xff5c5757));
    return  MultiProvider(
      providers: [
        Provider<DataRepository>(create: (context)=> DataRepository(),)
      ],
          child: MaterialApp(
                theme: ThemeData(backgroundColor: Colors.grey),
            home: SearchScreen(),
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