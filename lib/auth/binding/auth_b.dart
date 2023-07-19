import 'package:get/get.dart';
import 'package:rsk/auth/controller/Auth_c.dart';
import 'package:rsk/auth/repository/auth_r.dart';
import 'package:rsk/auth/service/auth_c.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
        () => AuthController(AuthRepository(AuthApi())));
  }
}
