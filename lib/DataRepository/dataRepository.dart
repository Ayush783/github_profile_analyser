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

  Future<List<dynamic>> getRepoData(String id)async{
    final List<dynamic> data = await apiService.getUserRepoData(id);
    return data;
  }

  Future<List<dynamic>> getStarData(String id)async{
    final List<dynamic> data = await apiService.getUserStarredData(id);
    return data;
  }

  List<String> endpoints = [
    'login',
    'avatar_url',
    'html_url',
    'name',
    'email',
    'bio',
    'public_repos',
    'followers',
    'following'
  ];
}

class User{
  final Map map;
  User({@required this.map});
}