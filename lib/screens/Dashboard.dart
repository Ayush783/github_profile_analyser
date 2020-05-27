import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:github_profile_analyser/DataRepository/dataRepository.dart';
import 'package:github_profile_analyser/screens/AboutScreen.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final size = MediaQuery.of(context).size;
    final userRepo = Provider.of<UserRepo>(context);
    final List repo = userRepo.map['repo'];
    final List star = userRepo.map['star'];
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Hero(
              tag: 'img',
              child: Container(
                height: size.height * 0.4,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('${user.map['avatar_url']}'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.7), BlendMode.dstATop)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Material(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 10,
                        child: SizedBox(
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text('\t\t\t\t\t\t'),
                              Text(
                                '${user.map['name']}',
                                style: TextStyle(
                                    fontFamily: 'Sans',
                                    fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Provider<User>.value(
                                      value: user,
                                      child: AboutScreen(),)));
                                  },
                                  child: Icon(
                                    MaterialCommunityIcons.information_outline,
                                    size: 15,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Text(
                        '${user.map['bio']}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Sans',
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(color: Colors.black, blurRadius: 5)
                            ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                   
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
//  AppBar(backgroundColor: Colors.white,
//         title: Text('${user.map['name']}',style: TextStyle(color: Colors.black,fontFamily: 'Sans'),),
//         ),
