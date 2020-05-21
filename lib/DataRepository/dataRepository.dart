import 'package:github_profile_analyser/services/APIService.dart';
import 'package:github_profile_analyser/services/api.dart';

class DataRepository {
  static final api = API();
  final apiService = APIService(api);
  Future<Map> getData() async {
    Map<String,dynamic> map={};
    final Map data = await apiService.getUserData('Ayush783');
    if(data!=null){
    for(int i =0; i < endpoints.length ; i++){
      if(data.containsKey(endpoints[i])){
        map[endpoints[i]] = data[endpoints[i]];
      }
    }
    }
    print(map);
    return map;
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
