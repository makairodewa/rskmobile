import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rsk/utils/model/resume_model.dart';
import 'package:rsk/bayi/respository/bayi_repository.dart';

class BayiController extends GetxController {
  final BayiRepository repository;
  final RxList<ResumeModel> resumes = RxList<ResumeModel>();
  final RxBool isLoading = true.obs;
  RxBool isSuccess = false.obs;
  Rx<Uint8List?> exportIMage = Rx<Uint8List?>(null);
  Rx<File>? photoKiri, photoKanan;
  BayiController(this.repository);

  Future<void> getPhotoKiri() async {
    final ImagePicker picker = ImagePicker();
    final XFile? kiri = await picker.pickImage(source: ImageSource.camera);
    if (kiri != null) {
      photoKiri = Rx<File>(File(kiri.path));
      update();
    }
  }

  Future<void> getPhotoKanan() async {
    final ImagePicker picker = ImagePicker();
    final XFile? kanan = await picker.pickImage(source: ImageSource.camera);
    if (kanan != null) {
      photoKanan = Rx<File>(File(kanan.path));
      print(photoKanan!.value);
      update();
    }
  }

  void clearImage() {
    photoKanan = null;
    photoKiri = null;
  }

  @override
  void onInit() {
    super.onInit();
    fetchBayi();
  }

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
