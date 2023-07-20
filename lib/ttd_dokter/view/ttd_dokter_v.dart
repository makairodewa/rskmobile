import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsk/ttd_dokter/controller/ttd_dokter_c.dart';
import 'package:rsk/widget/resume_widget.dart';

class TtdDokterPage extends GetView<TtdDokterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resume Pasien')),
      body: Obx(() {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.resumes.isEmpty) {
          return const Center(
            child: Text("Data Resume kosong"),
          );
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: controller.resumes.length,
            itemBuilder: (context, index) {
              final data = controller.resumes[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ResumeData(
                  data: data,
                  isDokter: true,
                ),
              );
            },
          );
        }
      }),
    );
  }
}
