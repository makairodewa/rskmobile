import 'package:rsk/utils/model/resume_model.dart';
import 'package:rsk/bayi/services/bayi_service.dart';

class BayiRepository {
  final BayiApi api;
  BayiRepository(this.api);
  Future<List<ResumeModel>> getAll() async {
    final response = await api.getAll();
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
    final response = await api.updateGambar(norawat, kiri, kanan);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal memperbarui gambar.');
    }
  }
}
