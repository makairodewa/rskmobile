import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsk/resume_pasien/controller/resume_controller.dart';
import 'package:rsk/widget/resume_widget.dart';

class ResumePage extends GetView<ResumeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resume Pasien"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Obx(
          () {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (controller.resumes.isEmpty) {
              return const Center(
                child: Text("Data kosong."),
              );
            } else {
              return ListView.separated(
                itemBuilder: (context, index) {
                  final data = controller.resumes[index];
                  return ResumeData(
                    data: data,
                    isDokter: false,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: controller.resumes.length,
              );
            }
          },
        ),
      ),
    );
  }
}
