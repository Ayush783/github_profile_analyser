
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:github_profile_analyser/services/api.dart';

class APIService{
  final API api;
  APIService(this.api);

  Future<Map> getUserData(String user)async{
    final uri = api.userUri().toString()+'/$user';
    final response = await http.get(uri);
    if(response.statusCode==200){
      final data = jsonDecode(response.body);
      return data;
    }
    throw response;
  }

}

