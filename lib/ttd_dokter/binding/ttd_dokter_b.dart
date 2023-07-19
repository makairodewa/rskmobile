import 'package:get/get.dart';
import 'package:rsk/ttd_dokter/api/ttd_dokter_api.dart';
import 'package:rsk/ttd_dokter/controller/ttd_dokter_c.dart';
import 'package:rsk/ttd_dokter/repository/ttd_respository.dart';

class TtdDokterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TtdDokterController>(
        () => TtdDokterController(TtdDokterRepository(TtdDokterApi())));
  }
}
