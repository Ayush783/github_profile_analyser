import 'package:flutter/cupertino.dart';
import 'package:github_profile_analyser/services/APIService.dart';
import 'package:github_profile_analyser/services/api.dart';

class DataRepository {
  static final api = API();
  final apiService = APIService(api);
  Future<User> getData(String user) async {
    Map<String,dynamic> map={};
    final Map data = await apiService.getUserData(user);
    if(data!=null){
    for(int i =0; i < endpoints.length ; i++){
      if(data.containsKey(endpoints[i])){
        map[endpoints[i]] = data[endpoints[i]];
      }
    }
    }
    return User(map: map);
  }

  Future<UserRepo> getRepoData(String id)async{
    final List<dynamic> repoData = await apiService.getUserRepoData(id);
    final List<dynamic> starData = await apiService.getUserStarredData(id);
    final Map map = {};
    map['repo'] = List.from(repoData);
    map['star'] = List.from(starData);
    return UserRepo(map: map);
  }

  List<String> endpoints = [
    'login',
    'avatar_url',
    'html_url',
    'name',
    'blog',
    'location',
    'email',
    'bio',
    'public_repos',
    'followers',
    'following',
  ];
}

class User{
  final Map map;
  User({@required this.map});
}
class UserRepo{
  final Map map;
  UserRepo({@required this.map});
}