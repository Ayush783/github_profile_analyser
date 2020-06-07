import 'package:flutter/material.dart';
import 'package:github_profile_analyser/DataRepository/dataRepository.dart';
import 'package:github_profile_analyser/notifiers/notifier.dart';
import 'package:github_profile_analyser/screens/AboutScreen.dart';
import 'package:github_profile_analyser/ui_models/followerButton.dart';
import 'package:github_profile_analyser/ui_models/followingButton.dart';
import 'package:github_profile_analyser/ui_models/repoButton.dart';
import 'package:github_profile_analyser/ui_models/starButton.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<DataNotifier>(context);
    final user = Provider.of<User>(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff5c5757),
        body: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.4,
              width: size.width,
              decoration: BoxDecoration(
                  color: Color(0xff363434),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Material(
                      color: Color(0xff5c5757),
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
                                  color: Color(0xffefecec),
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                            Shadow(color: Colors.black, blurRadius: 5)
                          ]),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Provider<User>.value(
                                                value: user,
                                                child: AboutScreen(),
                                              )));
                                },
                                child: Lottie.asset('images/info1.json',height: 20),
                                ),
                          ],
                        ),
                      ),
                    ),
                    CircleAvatar(
                        backgroundColor: Color(0xff5c5757),
                        radius: 55,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(user.map['avatar_url']),
                        )),
                    Text(
                      '${user.map['bio']}',
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      style: TextStyle(
                          fontFamily: 'Sans',
                          color: Color(0xffefecec),
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(color: Colors.black, blurRadius: 5)
                          ]),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      repoButton(notifier.repo, notifier.showRepo, notifier.e1),
                      starButton(notifier.showStar, notifier.star, notifier.e2),
                      followerButton(notifier.flwr, notifier.showFlwr, notifier.e3),
                      followingButton(notifier.flwng, notifier.showFlwng, notifier.e4),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  notifier.repoSearch,
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    child: Expanded(
                      child: notifier.list,
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
