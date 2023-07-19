import 'package:rsk/auth/service/auth_c.dart';

class AuthRepository {
  final AuthApi api;

  AuthRepository(this.api);

  getAll() {
    return api.getAll();
  }
}
