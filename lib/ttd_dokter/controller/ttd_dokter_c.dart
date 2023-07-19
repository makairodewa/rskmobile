import 'package:get/get.dart';
import 'package:rsk/ttd_dokter/repository/ttd_respository.dart';
import 'package:rsk/utils/model/resume_model.dart';

class TtdDokterController extends GetxController {
  final TtdDokterRepository repository;
  TtdDokterController(this.repository);
  final RxList<ResumeModel> resumes = RxList<ResumeModel>();
  final Rx<bool> _isLoading = true.obs;
  get isLoading => _isLoading.value;
  Future<void> getAll() async {
    try {
      var data = await repository.getAll();
      resumes.assignAll(data);
      _isLoading(false);
    } catch (e) {
      _isLoading(false);
      throw Exception(e);
    }
  }
}
