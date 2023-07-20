import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rsk/constanta/contanta.dart';
import 'package:rsk/routes/app_routes.dart';

class BayiApi extends GetConnect {
  final storage = GetStorage();
  Future<Response> getAll() {
    final token = storage.read('token');
    return get(
      "$baseUrls/bayi",
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }

  Future<Response> updateGambar(String norawat, File kiri, File kanan) async {
    final token = storage.read('token');
    final noRawat = norawat.replaceAll("/", "").replaceFirst("", "");
    final kiriBase64 = base64Encode(await kiri.readAsBytes());
    final kananBase64 = base64Encode(await kanan.readAsBytes());
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final body = {
      'kiri': kiriBase64,
      'kanan': kananBase64,
    };
    return post("$baseUrls/bayi/$noRawat", body, headers: headers);
  }

  BayiApi() {
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
      duration: Duration(seconds: 2),
      onTap: (snackbar) {
        Get.offAllNamed(AppRoutes.AUTH);
      },
    );
  }
}
