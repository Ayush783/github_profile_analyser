import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:github_profile_analyser/DataRepository/dataRepository.dart';
import 'package:github_profile_analyser/screens/AboutScreen.dart';
import 'package:github_profile_analyser/ui_models/followerButton.dart';
import 'package:github_profile_analyser/ui_models/followerCard.dart';
import 'package:github_profile_analyser/ui_models/followingButton.dart';
import 'package:github_profile_analyser/ui_models/repoButton.dart';
import 'package:github_profile_analyser/ui_models/repoCard.dart';
import 'package:github_profile_analyser/ui_models/starButton.dart';
import 'package:github_profile_analyser/ui_models/starCard.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Widget _repo, _star, _flwr, _flwng;
  double e1, e2, e3, e4;
  Widget _list = Text('');
  @override
  void initState() {
    super.initState();
    _repo = Icon(MaterialCommunityIcons.source_repository_multiple);
    _star = Icon(MaterialCommunityIcons.star);
    _flwng = Icon(MaterialCommunityIcons.account);
    _flwr = Icon(MaterialCommunityIcons.account_group);
    e1 = 3;
    e2 = 3;
    e3 = 3;
    e4 = 3;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final size = MediaQuery.of(context).size;
    final userRepo = Provider.of<UserRepo>(context);
    final List repo = userRepo.map['repo'];
    final List star = userRepo.map['star'];
    final List follower = userRepo.map['followers'];
    final List following = userRepo.map['following'];

    showRepo() {
      _repo = Text(
        '${user.map['public_repos']}',
        style: TextStyle(
            fontFamily: 'Sans', fontWeight: FontWeight.bold, fontSize: 20),
      );
      e1 = 30;
      e2 = 3;
      e3 = 3;
      e4 = 3;
      _star = Icon(MaterialCommunityIcons.star);
      _flwng = Icon(MaterialCommunityIcons.account);
      _flwr = Icon(MaterialCommunityIcons.account_group);
      _list = AnimationLimiter(
        child: ListView.builder(
            itemCount: repo.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 675),
                child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                        child: repoCard(
                            repo[index]['name'],
                            repo[index]['language'],
                            user.map['name'],
                            repo[index]['html_url']))),
              );
            }),
      );
      setState(() {});
    }

    showStar() {
      _star = Text('${star.length}',
          style: TextStyle(
              fontFamily: 'Sans', fontWeight: FontWeight.bold, fontSize: 20));
      e2 = 30;
      e1 = 3;
      e3 = 3;
      e4 = 3;
      _repo = Icon(MaterialCommunityIcons.source_repository_multiple);
      _flwng = Icon(MaterialCommunityIcons.account);
      _flwr = Icon(MaterialCommunityIcons.account_group);
      _list = ListView.builder(
          itemCount: star.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 675),
              child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                      child: starCard(
                          star[index]['name'],
                          star[index]['language'],
                          star[index]['owner']['login'],
                          star[index]['html_url']))),
            );
          });
      setState(() {});
    }

    showFollower() {
      _flwr = Text('${user.map['followers']}',
          style: TextStyle(
              fontFamily: 'Sans', fontWeight: FontWeight.bold, fontSize: 20));
      e3 = 30;
      e1 = 3;
      e2 = 3;
      e4 = 3;
      _repo = Icon(MaterialCommunityIcons.source_repository_multiple);
      _star = Icon(MaterialCommunityIcons.star);
      _flwng = Icon(MaterialCommunityIcons.account);
      _list = AnimationLimiter(
        key: UniqueKey(),
        child: ListView.builder(
            itemCount: follower.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 675),
                child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                        child: flwrCard(
                            follower[index]['login'],
                            follower[index]['avatar_url'],
                            follower[index]['html_url']))),
              );
            }),
      );
      setState(() {});
    }

    showFollowing() {
      _flwng = Text('${user.map['following']}',
          style: TextStyle(
              fontFamily: 'Sans', fontWeight: FontWeight.bold, fontSize: 20));
      _repo = Icon(MaterialCommunityIcons.source_repository_multiple);
      _star = Icon(MaterialCommunityIcons.star);
      _flwr = Icon(MaterialCommunityIcons.account_group);
      e4 = 30;
      e1 = 3;
      e2 = 3;
      e3 = 3;
      _list = AnimationLimiter(
        key: UniqueKey(),
        child: ListView.builder(
            itemCount: following.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 675),
                child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                        child: flwrCard(
                            following[index]['login'],
                            following[index]['avatar_url'],
                            following[index]['html_url']))),
              );
            }),
      );
      setState(() {});
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Provider<User>.value(
                                                value: user,
                                                child: AboutScreen(),
                                              )));
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
            Expanded(
                child: Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      repoButton(_repo, showRepo, e1),
                      starButton(showStar, _star, e2),
                      followerButton(_flwr, showFollower, e3),
                      followingButton(_flwng, showFollowing, e4),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  Container(
                    child: Expanded(
                      child: _list,
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
