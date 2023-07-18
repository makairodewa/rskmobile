import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsk/controller/bayi_controller.dart';
import 'package:rsk/models/resume_model.dart';

class BayiPage extends GetView<BayiController> {
  const BayiPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Bayi"),
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
                  return _sectionResumeData(data, context);
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

  Container _sectionResumeData(ResumeModel data, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        isThreeLine: true,
        style: ListTileStyle.list,
        title: Text(data.norawat),
        onTap: () {},
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.norm),
            Text(data.nama),
          ],
        ),
      ),
    );
  }
}
