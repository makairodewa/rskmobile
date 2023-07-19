import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsk/utils/model/resume_model.dart';
import 'package:rsk/bayi/respository/bayi_repository.dart';

class BayiController extends GetxController {
  final BayiRepository repository;
  final RxList<ResumeModel> resumes = RxList<ResumeModel>();
  final RxBool isLoading = true.obs;
  RxBool isSuccess = false.obs;
  Rx<Uint8List?> exportIMage = Rx<Uint8List?>(null);
  @override
  void onInit() {
    super.onInit();
    fetchBayi();
  }

  BayiController(this.repository);
  Future<void> fetchBayi() async {
    try {
      final List<ResumeModel> fetchedResumes = await repository.getAll();
      resumes.assignAll(fetchedResumes);
    } catch (e) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateGambar(String norawat, kiri, kanan) async {
    try {
      isSuccess.value = await repository.updateGambar(norawat, kiri, kanan);
      fetchBayi();
      Get.back();
      Get.snackbar(
        'Success',
        'Berhasil gambar telapak bayi.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Gagal',
        'Gagal gambar telapak bayi.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
      rethrow;
    }
  }
}
