import 'dart:typed_data';

import 'package:rsk/ttd_dokter/api/ttd_dokter_api.dart';
import 'package:rsk/utils/model/resume_model.dart';

class TtdDokterRepository {
  final TtdDokterApi _api;

  TtdDokterRepository(this._api);

  Future<List<ResumeModel>> getAll() async {
    final response = await _api.getAll();
    if (response.statusCode == 200) {
      final List<dynamic> data = response.body;
      final List<ResumeModel> resumeList =
          data.map((e) => ResumeModel.fromJson(e)).toList();
      return resumeList;
    } else {
      throw Exception("Failed to load data");
    }
  }

  Future<bool> updateTTD(String norawat, Uint8List ttd) async {
    final response = await _api.addTtdDokter(norawat, ttd);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal memperbarui tanda tangan.');
    }
  }
}
