import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:rsk/constanta/contanta.dart';

class TtdDokterApi extends GetConnect {
  Future<Response> getAll() async {
    return get("$baseUrls/resume");
  }

  Future<Response> addTtdDokter(String norawat, Uint8List ttd) {
    final noRawat = norawat.replaceAll("/", "").replaceFirst("", "");
    final base64Ttd = base64Encode(ttd);
    final headers = {
      'Content-Type': 'application/json',
    };

    final body = {
      'tandaTangan': base64Ttd,
    };
    return post("$baseUrls/resume/$noRawat/ttd/dokter", body, headers: headers);
  }
}
