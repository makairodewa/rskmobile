import 'dart:convert';

import 'package:get/get_connect.dart';
import 'package:rsk/constanta/contanta.dart';

class BayiApi extends GetConnect {
  Future<Response> getAll() {
    return get("$baseUrls/bayi");
  }

  Future<Response> updateGambar(String norawat, kiri, kanan) {
    final noRawat = norawat.replaceAll("/", "").replaceFirst("", "");
    final kiriBase64 = base64Encode(kiri);
    final kananBase64 = base64Encode(kanan);
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = {
      'kiri': kiriBase64,
      'kanan': kananBase64,
    };
    return post("$baseUrls/bayi/$noRawat/", body, headers: headers);
  }
}
