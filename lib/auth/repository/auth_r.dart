import 'package:rsk/auth/service/auth_servide.dart';

class AuthRepository {
  final AuthApi api;

  AuthRepository(this.api);

  getAll() {
    return api.getAll();
  }

  Future<String> login(username, password) async {
    final response = await api.login(username, password);
    if (response.statusCode == 200) {
      return response.body['access_token'];
    } else {
      throw Exception(response.body['message']);
    }
  }
}
