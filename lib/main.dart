import 'package:flutter/material.dart';
import 'package:github_profile_analyser/DataRepository/dataRepository.dart';
import 'package:github_profile_analyser/screens/dashboard.dart';
import 'package:github_profile_analyser/screens/splashScreen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'splash',
        routes: {
          'splash': (context) => SplashScreen(),
          'home': (context) => Dashboard()
        },
        debugShowCheckedModeBanner: false,
    );
  }
}


// void getName() async{
//     final map = await DataRepository().getData();
//     setState(() {
//       name = map['name'];
//     });
//   }
