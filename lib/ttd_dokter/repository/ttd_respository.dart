import 'package:rsk/ttd_dokter/api/ttd_dokter_api.dart';
import 'package:rsk/utils/model/resume_model.dart';

class TtdDokterRepository {
  final TtdDokterApi api;

  TtdDokterRepository(this.api);

  Future<List<ResumeModel>> getAll() async {
    final response = await api.getAll();
    print(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> data = response.body;
      final List<ResumeModel> resumeList =
          data.map((e) => ResumeModel.fromJson(e)).toList();
      return resumeList;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
