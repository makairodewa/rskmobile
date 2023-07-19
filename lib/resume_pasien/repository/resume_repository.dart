import 'dart:typed_data';
import 'package:rsk/utils/model/resume_model.dart';
import 'package:rsk/resume_pasien/repository/resume_service.dart';

class ResumeRepository {
  final ResumeApi _api;
  ResumeRepository(this._api);
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

  Future<bool> updateTTD(String norawat, Uint8List ttd) async {
    final response = await _api.addTtdPasien(norawat, ttd);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal memperbarui tanda tangan.');
    }
  }
}
