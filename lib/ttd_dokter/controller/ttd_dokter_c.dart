import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsk/ttd_dokter/repository/ttd_respository.dart';
import 'package:rsk/utils/model/resume_model.dart';
import 'package:signature/signature.dart';

class TtdDokterController extends GetxController {
  final TtdDokterRepository _repository;
  TtdDokterController(this._repository);
  final RxList<ResumeModel> resumes = RxList<ResumeModel>();
  final Rx<bool> _isLoading = true.obs;
  final Rx<bool> isSuccess = false.obs;
  final Rx<bool> showClearIcon = true.obs;
  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;
  final SignatureController _signatureController = SignatureController();
  SignatureController get signatureController => _signatureController;
  Rx<Uint8List?> exportIMage = Rx<Uint8List?>(null);

  Future<void> getAll() async {
    try {
      var data = await _repository.getAll();
      resumes.assignAll(data);
      _isLoading(false);
    } catch (e) {
      _isLoading(false);
      throw Exception(e);
    }
  }

  void clearSignature() {
    signatureController.clear();
    showClearIcon.value = false;
  }

  @override
  void onInit() {
    getAll();
    super.onInit();
  }

  Future<void> updateTTD(String norawat, Uint8List ttd) async {
    try {
      isSuccess.value = await _repository.updateTTD(norawat, ttd);
      exportIMage.value = null;
      getAll();
      Get.back();
      Get.snackbar(
        'Success',
        'Berhasil memperbarui tanda tangan.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
    } catch (e) {
      isLoading = false;
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
