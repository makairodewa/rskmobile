import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsk/utils/model/resume_model.dart';
import 'package:rsk/resume_pasien/repository/resume_repository.dart';
import 'package:signature/signature.dart';

class ResumeController extends GetxController {
  final ResumeRepository _repository;
  ResumeController(this._repository);
  final RxList<ResumeModel> resumes = RxList<ResumeModel>();
  final RxBool isLoading = true.obs;
  RxBool isSuccess = false.obs;
  final SignatureController _signatureController = SignatureController();
  SignatureController get signatureController => _signatureController;
  Rx<Uint8List?> exportIMage = Rx<Uint8List?>(null);
  RxBool showClearIcon = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchResumes();
  }

  void clearSignature() {
    signatureController.clear();
    showClearIcon.value = false;
  }

  Future<void> fetchResumes() async {
    try {
      final List<ResumeModel> fetchedResumes = await _repository.getAll();
      resumes.assignAll(fetchedResumes);
    } catch (e) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateTTD(String norawat, Uint8List ttd) async {
    try {
      isSuccess.value = await _repository.updateTTD(norawat, ttd);
      exportIMage.value = null;
      fetchResumes();
      Get.back();
      Get.snackbar(
        'Success',
        'Berhasil memperbarui tanda tangan.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Gagal',
        'Gagal memperbarui tanda tangan.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
      rethrow;
    }
  }
}
