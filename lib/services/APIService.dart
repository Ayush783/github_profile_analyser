
import 'dart:convert';

import 'package:github_profile_analyser/services/accessToken.dart';
import 'package:http/http.dart' as http;
import 'package:github_profile_analyser/services/api.dart';

class APIService{
  final API api;
  APIService(this.api);

  Future<Map<String,dynamic>> getUserData(String user)async{
    final uri = api.userUri().toString()+'/$user';
    print(uri);
    final response = await http.get(uri, headers: {'Authorization':'Token $access_token'});
    if(response.statusCode==200){
      final data = jsonDecode(response.body);
      return data;
    }
    throw response;
  }

}

