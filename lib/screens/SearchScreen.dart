import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:github_profile_analyser/DataRepository/dataRepository.dart';
import 'package:github_profile_analyser/notifiers/notifier.dart';
import 'package:github_profile_analyser/screens/Dashboard.dart';
import 'package:github_profile_analyser/ui_models/G0Button.dart';
import 'package:github_profile_analyser/ui_models/SearchTextField.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  Widget _widget;
  String username;
  bool isVisible2;
  AnimationController _controller;
  TextEditingController controller = new TextEditingController(text: '');
  static final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  waitTime() async {
    await Future.delayed(Duration(milliseconds: 600));
    setState(() {
      isVisible2 = true;
    });
  }

  @override
  void initState() {
    super.initState();
    username = '';
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _controller.forward();
    controller.text = '';
    isVisible2 = false;
    _widget = Text(
      "Go",
      style: TextStyle(fontFamily: 'Sans', color: Colors.white, fontSize: 16),
    );
    waitTime();
  }

  void setName(String value) {
    setState(() {
      username = value;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        final UserRepo userRepo = await data.getRepoData(user.map['login']);
        if (user.map.isNotEmpty) {
          FocusScope.of(context).unfocus();
          _widget = Text(
            "Go",
            style: TextStyle(
                fontFamily: 'Sans', color: Colors.white, fontSize: 16),
          );
          print(user.map['name']);
          controller.text='';
          username='';
          setState(() {});
          Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (BuildContext cpntext,
                      Animation<double> animation,
                      Animation<double> secAnimation) {
                    return Provider<User>.value(
                        value: user,
                        child: Provider<UserRepo>.value(
                            value: userRepo, child: ChangeNotifierProvider<DataNotifier>(
                              create:(context)=> DataNotifier(context),
                              child: Dashboard())));
                  },
                  transitionDuration: Duration(milliseconds: 360),
                  transitionsBuilder: (BuildContext cpntext,
                      Animation<double> animation,
                      Animation<double> secAnimation,
                      Widget child) {
                    animation = CurvedAnimation(
                        parent: animation, curve: Curves.easeIn);
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  }));
        }
      } catch (e) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: controller.text==''?Text('Username cannot be empty',style: TextStyle(fontFamily: 'Sans'),
        ):Text('Something went wrong!, Please try again',style: TextStyle(fontFamily: 'Sans'),)
          ,)
          );
        _widget = Text(
          "Go",
          style:
              TextStyle(fontFamily: 'Sans', color: Colors.white, fontSize: 16),
        );
        setState(() {});
      }
    }

    Future<bool> _willpop() async {
      return false;
    }

    return WillPopScope(
      onWillPop: _willpop,
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Color(0xff5c5757),
          body: Stack(
            children: <Widget>[
              AnimatedBuilder(
                animation: _controller,
                builder: (_, child) {
                  return Transform.translate(
                    offset: Offset(0, -size.height * 0.65 * _controller.value),
                    child: child,
                  );
                },
                child: Padding(
                    padding: EdgeInsets.only(
                      right: size.width * 0.1,
                      left: size.width * 0.178,
                      top: size.height * 0.8,
                    ),
                    child: Text(
                      'Github Explorer',
                      style: new TextStyle(
                        color: Colors.black,
                        shadows: [Shadow(color: Colors.white, blurRadius: 10)],
                        fontFamily: 'Sans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        //foreground: Paint()..shader = linearGradient),
                      ),
                    )),
              ),
              AnimatedOpacity(
                opacity: isVisible2 ? 1 : 0,
                duration: Duration(seconds: 2),
                curve: Curves.easeInToLinear,
                child: Padding(
                  padding:  EdgeInsets.only(left: 8.0, top: size.height*0.25, right: 8),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 125)),
                        //textfield
                        Padding(
                          padding:  EdgeInsets.only(left:20.0,right: 20,bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Material(
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide.none),
                            shadowColor: Color(0xffefecec),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: searchUser(controller,setName)),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 25)),
                        //search button
                        goButton(function: search, widget: _widget),
                        Padding(padding: EdgeInsets.only(top: 100)),
                        //show if any error comes up
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
