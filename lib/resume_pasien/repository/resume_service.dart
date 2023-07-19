import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get_connect.dart';
import 'package:rsk/constanta/contanta.dart';

class ResumeApi extends GetConnect {
  Future<Response> getAll() {
    return get("$baseUrls/resume");
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
}
