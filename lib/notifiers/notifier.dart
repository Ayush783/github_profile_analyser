import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_profile_analyser/DataRepository/dataRepository.dart';
import 'package:github_profile_analyser/ui_models/SearchTextField.dart';
import 'package:github_profile_analyser/ui_models/followerCard.dart';
import 'package:github_profile_analyser/ui_models/followingCard.dart';
import 'package:github_profile_analyser/ui_models/repoCard.dart';
import 'package:github_profile_analyser/ui_models/starCard.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class DataNotifier extends ChangeNotifier {
  double _e1, _e2, _e3, _e4;
  Widget _star, _flwr, _repo, _list, _flwng, _repoSearch;
  User _user;
  UserRepo _userRepo;
  TextEditingController _controller;

  DataNotifier(BuildContext context){
    _user = Provider.of<User>(context, listen: false);
    _userRepo = Provider.of<UserRepo>(context, listen: false);
    _e1 = 3;
    _e2 = 3;
    _e3 = 3;
    _e4 = 3;
    _star = Icon(MaterialCommunityIcons.star);
    _repo = Icon(MaterialCommunityIcons.source_repository_multiple);
    _flwng = Icon(MaterialCommunityIcons.account);
    _flwr = Icon(MaterialCommunityIcons.account_group);
    _list = Center(child: Lottie.asset('images/above.json', height: 100));
    _repoSearch = Container();
    _controller = TextEditingController();
  }
  //getters
  double get e1 => _e1;
  double get e2 => _e2;
  double get e3 => _e3;
  double get e4 => _e4;
  Widget get star => _star;
  Widget get repo => _repo;
  Widget get flwr => _flwr;
  Widget get flwng => _flwng;
  Widget get list => _list;
  int get repoNumber => _user.map['public_repos'];
  List get repoList => _userRepo.map['repo'];
  List get starList => _userRepo.map['star'];
  List get flwrList => _userRepo.map['followers'];
  List get flwngList => _userRepo.map['following'];
  Widget get repoSearch => _repoSearch;
  TextEditingController get controller => _controller;

  void findRepo(String value) {
    print(_controller.text);
    if (value == '') {
      _list = AnimationLimiter(
        child: ListView.builder(
            itemCount: repoList.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 675),
                child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                        child: repoCard(
                            repoList[index]['name'],
                            repoList[index]['language'],
                            _user.map['name'],
                            repoList[index]['html_url'],
                            repoList[index]['description']))),
              );
            }),
      );
    } else {
      for (int i = 0; i < repoList.length; i++) {
        if (repoList[i]['name'] == value) {
          _list = Column(
            children: <Widget>[
              repoCard(
                  repoList[i]['name'],
                  repoList[i]['language'],
                  _user.map['name'],
                  repoList[i]['html_url'],
                  repoList[i]['description']),
              Container(),
              Container(),
            ],
          );
          break;
        } else {
          _list = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset('images/error.svg',color: Colors.white,height: 50,width: 50,),
              Text('Error!. Not found',style: TextStyle(fontFamily: 'Sans',color: Colors.white),)
            ],
          );
        }
      }
    }
    notifyListeners();
  }
  void findStar(String value) {
    print(_controller.text);
    if (value == '') {
      _list = AnimationLimiter(
        child: ListView.builder(
            itemCount: starList.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 675),
                child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                        child:starCard(
                          starList[index]['name'],
                          starList[index]['language'],
                          starList[index]['owner']['login'],
                          starList[index]['html_url']))),
              );
            }),
      );
    } else {
      for (int i = 0; i < starList.length; i++) {
        if (starList[i]['name'] == value) {
          _list = Column(
            children: <Widget>[
              starCard(
                          starList[i]['name'],
                          starList[i]['language'],
                          starList[i]['owner']['login'],
                          starList[i]['html_url']),
              Container(),
              Container(),
            ],
          );
          break;
        } else {
          _list = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset('images/error.svg',color: Colors.white,height: 50,width: 50,),
              Text('Error!. Not found',style: TextStyle(fontFamily: 'Sans',color: Colors.white),)
            ],
          );
        }
      }
    }
    notifyListeners();
  }

  void showRepo({
    double e1 = 30,
    double e2 = 3,
    double e3 = 3,
    double e4 = 3,
    Widget star = const Icon(MaterialCommunityIcons.star),
    Widget flwr = const Icon(MaterialCommunityIcons.account_group),
    Widget flwng = const Icon(MaterialCommunityIcons.account),
  }) {
    _controller.clear();
    _e1 = e1;
    _e2 = e2;
    _e3 = e3;
    _e4 = e4;
    _repo = Text(
      '$repoNumber',
      style: TextStyle(
          fontFamily: 'Sans', fontWeight: FontWeight.bold, fontSize: 20),
    );
    _star = star;
    _flwr = flwr;
    _flwng = flwng;
    _list = AnimationLimiter(
      child: ListView.builder(
          itemCount: repoList.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 675),
              child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                      child: repoCard(
                          repoList[index]['name'],
                          repoList[index]['language'],
                          _user.map['name'],
                          repoList[index]['html_url'],
                          repoList[index]['description']))),
            );
          }),
    );
    _repoSearch = new Material(
      elevation: 20,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), side: BorderSide.none),
      shadowColor: Color(0xffefecec),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: searchUser(controller, findRepo,
              hint: "Enter Repo Name", height: 60)),
    );
    notifyListeners();
  }

  void showFlwng({
    double e1 = 3,
    double e2 = 3,
    double e3 = 3,
    double e4 = 30,
    Widget star = const Icon(MaterialCommunityIcons.star),
    Widget flwr = const Icon(MaterialCommunityIcons.account_group),
    Widget repo = const Icon(MaterialCommunityIcons.source_repository_multiple),
  }) {
    _e1 = e1;
    _e2 = e2;
    _e3 = e3;
    _e4 = e4;
    _repo = repo;
    _star = star;
    _flwr = flwr;
    _flwng = Text('${_user.map['following']}',
        style: TextStyle(
            fontFamily: 'Sans', fontWeight: FontWeight.bold, fontSize: 20));
    _list = AnimationLimiter(
      key: UniqueKey(),
      child: ListView.builder(
          itemCount: flwngList.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 675),
              child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                      child: flwngCard(
                          flwngList[index]['login'],
                          flwngList[index]['avatar_url'],
                          flwngList[index]['html_url']))),
            );
          }),
    );
    notifyListeners();
  }

  void showStar({
    double e1 = 3,
    double e2 = 30,
    double e3 = 3,
    double e4 = 3,
    Widget flwr = const Icon(MaterialCommunityIcons.account_group),
    Widget flwng = const Icon(MaterialCommunityIcons.account),
    Widget repo = const Icon(MaterialCommunityIcons.source_repository_multiple),
  }) {
    _controller.clear();
    _e1 = e1;
    _e2 = e2;
    _e3 = e3;
    _e4 = e4;
    _repo = repo;
    _star = Text('${starList.length}',
        style: TextStyle(
            fontFamily: 'Sans', fontWeight: FontWeight.bold, fontSize: 20));
    _flwr = flwr;
    _flwng = flwng;
    _list = AnimationLimiter(
      key: UniqueKey(),
      child: ListView.builder(
          itemCount: starList.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 675),
              child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                      child: starCard(
                          starList[index]['name'],
                          starList[index]['language'],
                          starList[index]['owner']['login'],
                          starList[index]['html_url']))),
            );
          }),
    );
    _repoSearch = new Material(
      elevation: 20,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), side: BorderSide.none),
      shadowColor: Color(0xffefecec),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: searchUser(controller, findStar,
              hint: "Enter Starred Repo Name", height: 60)),
    );
    notifyListeners();
  }

  void showFlwr({
    double e1 = 3,
    double e2 = 3,
    double e3 = 30,
    double e4 = 3,
    Widget star = const Icon(MaterialCommunityIcons.star),
    Widget flwng = const Icon(MaterialCommunityIcons.account),
    Widget repo = const Icon(MaterialCommunityIcons.source_repository_multiple),
  }) {
    _e1 = e1;
    _e2 = e2;
    _e3 = e3;
    _e4 = e4;
    _repo = repo;
    _star = star;
    _flwr = Text('${_user.map['followers']}',
        style: TextStyle(
            fontFamily: 'Sans', fontWeight: FontWeight.bold, fontSize: 20));
    _flwng = flwng;
    _list = AnimationLimiter(
      key: UniqueKey(),
      child: ListView.builder(
          itemCount: flwrList.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 675),
              child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                      child: flwrCard(
                          flwrList[index]['login'],
                          flwrList[index]['avatar_url'],
                          flwrList[index]['html_url']))),
            );
          }),
    );
    notifyListeners();
  }
}
