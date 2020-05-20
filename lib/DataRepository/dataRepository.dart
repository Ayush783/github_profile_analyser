import 'package:github_profile_analyser/services/APIService.dart';
import 'package:github_profile_analyser/services/api.dart';

class DataRepository {
  static final api = API();
  final apiService = APIService(api);
  getData() async {
    final Map<String, String> data = await apiService.getUserData('Ayush783');
    Map map = Map.fromIterable(endpoints,
        key: (k) => endpoints, value: (v) => data[endpoints]);
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
