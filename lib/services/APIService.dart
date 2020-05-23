
import 'dart:convert';

import 'package:github_profile_analyser/services/accessToken.dart';
import 'package:http/http.dart' as http;
import 'package:github_profile_analyser/services/api.dart';

class APIService{
  final API api;
  APIService(this.api);

  Future<Map<String,dynamic>> getUserData(String user)async{
    final uri = api.userUri().toString()+'/$user';
    final response = await http.get(uri, headers: {'Authorization':'Token $access_token'});
    if(response.statusCode==200){
      final data = jsonDecode(response.body);
      return data;
    }
    throw response;
  }

  Future<List<dynamic>> getUserRepoData(String user)async{
    final uri = api.userUri().toString()+'/$user'+'/repos';
    final response = await http.get(uri , headers: {'Authorization': 'Token $access_token'});
    if(response.statusCode==200){
      final List<dynamic> data = json.decode(response.body);
      if(data.isNotEmpty)
        return data;
    }
    throw response;
  }

  Future<List<dynamic>> getUserStarredData(String user)async{
    final uri = api.userUri().toString()+'/$user'+'/starred';
    final response = await http.get(uri , headers: {'Authorization': 'Token $access_token'});
    if(response.statusCode==200){
      final List<dynamic> data = json.decode(response.body);
      if(data.isNotEmpty)
        return data;
    }
    throw response;
  }

}

