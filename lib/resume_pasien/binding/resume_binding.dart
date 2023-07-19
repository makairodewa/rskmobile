import 'package:get/get.dart';
import 'package:rsk/resume_pasien/controller/resume_controller.dart';
import 'package:rsk/resume_pasien/repository/resume_repository.dart';
import 'package:rsk/resume_pasien/repository/resume_service.dart';

class ResumeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResumeController>(
        () => ResumeController(ResumeRepository(ResumeApi())));
  }
}
