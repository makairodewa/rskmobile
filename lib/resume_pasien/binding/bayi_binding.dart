import 'package:get/get.dart';
import 'package:rsk/bayi/controller/bayi_controller.dart';
import 'package:rsk/bayi/respository/bayi_repository.dart';
import 'package:rsk/bayi/services/bayi_service.dart';

class BayiBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BayiController>(
        () => BayiController(BayiRepository(BayiApi())));
  }
}
