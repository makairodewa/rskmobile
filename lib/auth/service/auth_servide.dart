import 'package:get/get_connect.dart';
import 'package:rsk/constanta/contanta.dart';

class AuthApi extends GetConnect {
  getAll() {}
  Future<Response> login(username, password) async {
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = {
      'email': username,
      'password': password,
    };
    return post("$baseUrls/login", body, headers: headers);
  }
}
