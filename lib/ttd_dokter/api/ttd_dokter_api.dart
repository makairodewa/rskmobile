import 'package:get/get.dart';
import 'package:rsk/constanta/contanta.dart';

class TtdDokterApi extends GetConnect {
  Future<Response> getAll() async {
    return get("$baseUrls/resume");
  }
}
