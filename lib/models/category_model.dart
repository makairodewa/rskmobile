import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsk/routes/app_routes.dart';

class CategoryModel {
  final String title;
  final String path;
  final Color boxColor;
  final void Function(BuildContext) onMoreTapped;

  CategoryModel(
      {required this.title,
      required this.path,
      required this.boxColor,
      required this.onMoreTapped});

  static List<CategoryModel> getCategory() {
    List<CategoryModel> categoris = [];
    categoris.add(CategoryModel(
      title: "TTD Pasien",
      path: "assets/icon/chemotherapy.png",
      boxColor: const Color(0xFFFEC38A),
      onMoreTapped: (context) {
        Get.toNamed(AppRoutes.RESUME);
      },
    ));
    categoris.add(CategoryModel(
      title: "TTD Dokter",
      path: "assets/icon/medical-team.png",
      boxColor: const Color(0xff5099B4),
      onMoreTapped: (context) {
        Get.toNamed(AppRoutes.DOKTER);
      },
    ));
    categoris.add(CategoryModel(
      title: "Telapak Bayi",
      path: "assets/icon/flip.png",
      boxColor: const Color(0xffEFF4FF),
      onMoreTapped: (context) {
        Get.toNamed(AppRoutes.BAYI);
      },
    ));

    return categoris;
  }
}
