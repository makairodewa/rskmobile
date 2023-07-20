// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsk/auth/repository/auth_r.dart';
import 'package:rsk/routes/app_routes.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final AuthRepository repository;
  AuthController(this.repository);
  Rx<bool> isSuccess = false.obs;
  Rx<bool> isLoading = true.obs;
  Rx<bool> isCheck = false.obs;
  Rx<bool> isobscureText = true.obs;
  final formKey = GlobalKey<FormState>().obs;
  final _storage = GetStorage();
  late TextEditingController username;
  late TextEditingController password;

  @override
  void onInit() {
    super.onInit();
    username = TextEditingController();
    password = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    username.dispose();
    password.dispose();
  }

  Future<void> prosesLogin(String username, String password) async {
    try {
      isLoading.value = true;
      String token = await repository.login(username, password);
      isSuccess.value = true;
      _storage.remove('token');
      if (isCheck.value) {
        _storage.write('isRememberMe', true);
        _storage.write('token', token);
      }
      Get.snackbar(
        'Success',
        'Login Berhasil.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );

      isLoading.value = false;
      Get.offNamed(AppRoutes.HOME);
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Gagal',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
      rethrow;
    }
  }
}
