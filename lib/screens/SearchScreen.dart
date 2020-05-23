import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:github_profile_analyser/DataRepository/dataRepository.dart';
import 'package:github_profile_analyser/screens/Dashboard.dart';
import 'package:github_profile_analyser/ui_models/G0Button.dart';
import 'package:github_profile_analyser/ui_models/SearchTextField.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin{

  Widget _widget;
  String username;
  bool isVisible;
  @override
  void initState() {
    super.initState();
    username = '';
    isVisible = false;
    _widget = Text(
      "Go",
      style: TextStyle(fontFamily: 'Sans', color: Colors.white, fontSize: 16),
    );
  }

  void setName(String value) {
    setState(() {
      username = value;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataRepository>(context, listen: false);
    void search() async {
      String name;
      setState(() {
        name = username;
        _widget = SpinKitPulse(
          color: Colors.white,
          duration: Duration(milliseconds: 700),
          size: 30,
        );
      });
      try {
        final User user = await data.getData(name);
        isVisible = false;
        if (user.map.isNotEmpty) {
          FocusScope.of(context).unfocus();
          _widget = Text(
            "Go",
            style: TextStyle(
                fontFamily: 'Sans', color: Colors.white, fontSize: 16),
          );
          Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (BuildContext cpntext,
                      Animation<double> animation,
                      Animation<double> secAnimation) {
                    return Provider<User>.value(
                      value: user,
                      child: Dashboard());
                  },
                  transitionDuration: Duration(milliseconds: 360),
                  transitionsBuilder: (BuildContext cpntext,
                      Animation<double> animation,
                      Animation<double> secAnimation,
                      Widget child) {
                    animation = CurvedAnimation(
                        parent: animation, curve: Curves.easeIn);
                        Animation<Offset> anm = Tween<Offset>(begin: Offset(0,1),end: Offset(0,0)).animate(animation);
                    return SlideTransition(
                      position: anm,
                      child: child,
                    );
                  }));
        }
      } catch (e) {
        isVisible = true;
        _widget = Text(
          "Go",
          style:
              TextStyle(fontFamily: 'Sans', color: Colors.white, fontSize: 16),
        );
        setState(() {});
      }
    }

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
                  //textfield
                  searchUser(setName),
                  Padding(padding: EdgeInsets.only(top: 25)),
                  //search button
                  goButton(function: search, widget: _widget),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  //show if any error comes up
                  Opacity(
                    opacity: isVisible ? 1 : 0,
                    child: Text(
                      'Something Went Wrong, Please Try Again!',
                      style: TextStyle(
                          fontFamily: 'Sans', color: Colors.red, fontSize: 11),
                    ),
                  )
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
