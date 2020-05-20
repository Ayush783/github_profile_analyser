
class API{
  static final String host = 'api.github.com';

  Uri userUri() => Uri(
      scheme: 'https',
      host: host,
      path: '/users',
      );

}