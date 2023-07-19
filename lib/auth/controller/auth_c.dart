// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsk/auth/repository/auth_r.dart';

class AuthController extends GetxController {
  final AuthRepository repository;
  AuthController(this.repository);

  Rx<bool> isobscureText = false.obs;

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

  showPassword() {
    isobscureText.value ? isobscureText(false) : isobscureText(true);
  }
}
