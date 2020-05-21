import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:github_profile_analyser/ui_models/G0Button.dart';
import 'package:github_profile_analyser/ui_models/SearchTextField.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Widget _widget;
  String username;
  @override
  void initState() {
    super.initState();
    username = '';
    _widget = Text(
      "Go",
      style: TextStyle(fontFamily: 'Sans', color: Colors.white, fontSize: 16),
    );
  }

  void search() {
    setState(() {
      _widget = SpinKitPulse(
        color: Colors.white,
        duration: Duration(milliseconds: 700),
        size: 30,
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 50, right: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                    child: Image.asset(
                  'images/bgImage1.png',
                  filterQuality: FilterQuality.high,
                )),

                Padding(padding: EdgeInsets.only(top: 55)),
                
                searchUser(username),

                Padding(padding: EdgeInsets.only(top: 25)),

                goButton(function: search , widget: _widget),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//  String name;
//   void getName() async{
//     final map = await DataRepository().getData();
//     setState(() {
//       name = map['name'];
//     });
//   }
