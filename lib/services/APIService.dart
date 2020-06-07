import 'dart:convert';

import 'package:github_profile_analyser/services/accessToken.dart';
import 'package:http/http.dart' as http;
import 'package:github_profile_analyser/services/api.dart';

class APIService {
  final API api;
  APIService(this.api);

  Future<Map<String, dynamic>> getUserData(String user) async {
    final uri = api.userUri().toString() + '/$user';
    final response =
        await http.get(uri, headers: {'Authorization': 'Token $access_token'});
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    }
    throw response;
  }

  Future<List<dynamic>> getUserRepoData(String user) async {
    List<dynamic> a =[];
    for(int i=1;;i++){
    final uri =
        api.userUri().toString() + '/$user' + '/repos?page=$i&per_page=100';
    final response =
        await http.get(uri, headers: {'Authorization': 'Token $access_token'});
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      a.addAll(data);
      if(data.length<100)
        break;
    }
    }
    return a;
  }

  Future<List<dynamic>> getUserStarredData(String user) async {
    List<dynamic> a = [];
    for(int i =1;;i++){
    final uri =
        api.userUri().toString() + '/$user' + '/starred?page=$i&per_page=100';
    final response =
        await http.get(uri, headers: {'Authorization': 'Token $access_token'});
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      a.addAll(data);
      if(data.length<100)
        break;
    }
    }
    return a;
  }

  Future<List<dynamic>> getUserFollowerData(String user) async {
    List<dynamic> a =[];
    for(int i=1;;i++){
    final uri =
        api.userUri().toString() + '/$user' + '/followers?page=$i&per_page=100';
    final response =
        await http.get(uri, headers: {'Authorization': 'Token $access_token'});
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      a.addAll(data);
      if(data.length<100)
        break;
    }
    }
    return a;
  }

  Future<List<dynamic>> getUserFollowingData(String user) async {
    List<dynamic> a=[];
    for(int i=1;;i++){
    final uri =
        api.userUri().toString() + '/$user' + '/following?page=$i&per_page=100';
    final response =
        await http.get(uri, headers: {'Authorization': 'Token $access_token'});
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      a.addAll(data);
      if(data.length<100)
        break;
    }
    }
    return a;
  }
}
