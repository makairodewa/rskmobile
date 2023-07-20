import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rsk/constanta/contanta.dart';
import 'package:rsk/routes/app_routes.dart';

class ResumeApi extends GetConnect {
  final storage = GetStorage();
  Future<Response> getAll() {
    final token = storage.read('token');
    return get(
      "$baseUrls/resume",
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }

  Future<Response> addTtdPasien(String norawat, Uint8List ttd) {
    final noRawat = norawat.replaceAll("/", "").replaceFirst("", "");
    final base64Ttd = base64Encode(ttd);

    final headers = {
      'Content-Type': 'application/json',
    };

    final body = {
      'tandaTangan': base64Ttd,
    };
    return post("$baseUrls/resume/$noRawat/tanda-tangan", body,
        headers: headers);
  }

  ResumeApi() {
    httpClient.addResponseModifier((request, response) {
      if (response.statusCode == 401 && response.body is Map<String, dynamic>) {
        final Map<String, dynamic>? bodyMap =
            response.body as Map<String, dynamic>?;
        final errorMessage = bodyMap?['error'] as String?;
        if (errorMessage != null && errorMessage == 'Token is invalid') {
          _logoutAndNavigateToLogin();
        }
      }
      return response;
    });
  }
  void _logoutAndNavigateToLogin() {
    storage.remove('token');
    storage.remove('isRememberMe');
    Get.snackbar(
      'Logged Out',
      'Anda telah keluar karena login dari perangkat lain.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      duration: Duration(seconds: 5),
      onTap: (snackbar) {
        Get.offAllNamed(AppRoutes.AUTH);
      },
    );
  }
}
