import 'package:get/get.dart';
import 'package:rsk/models/resume_model.dart';
import 'package:rsk/services/bayi_service.dart';

class BayiRepository {
  final BayiApi _api = Get.find();
  Future<List<ResumeModel>> getAll() async {
    final response = await _api.getAll();
    if (response.statusCode == 200) {
      final List<dynamic> data = response.body;
      final List<ResumeModel> resumeList =
          data.map((json) => ResumeModel.fromJson(json)).toList();
      return resumeList;
    } else {
      throw Exception("Failed to load data");
    }
  }

  Future<bool> updateGambar(String norawat, kiri, kanan) async {
    final response = await _api.updateGambar(norawat, kiri, kanan);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal memperbarui gambar.');
    }
  }
}
