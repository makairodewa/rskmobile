import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsk/resume_pasien/controller/resume_controller.dart';
import 'package:signature/signature.dart';

class SignatureWidget extends GetView<ResumeController> {
  const SignatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tanda Tangan Pasien'),
        leading: IconButton(
            onPressed: () {
              controller.exportIMage.value = null;
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: GetBuilder<ResumeController>(
        builder: (controller) => Column(
          children: [
            Signature(
              controller: controller.signatureController,
              height: 200,
              backgroundColor: Colors.white,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 30,
                  ),
                  onPressed: () async {
                    controller.exportIMage.value =
                        await controller.signatureController.toPngBytes();
                    controller.signatureController.clear();
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.red,
                    size: 30,
                  ),
                  onPressed: () async {
                    controller.exportIMage.value = null;
                    controller.signatureController.clear();
                  },
                ),
              ],
            ),
            Obx(
              () => controller.exportIMage.value != null
                  ? Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Image.memory(
                        controller.exportIMage.value!,
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: MediaQuery.of(context).size.height / 5,
                      ),
                    )
                  : const SizedBox(),
            ),
            Obx(
              () => (controller.exportIMage.value != null)
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        onPressed: controller.isLoading.value
                            ? null
                            : () async {
                                controller.isLoading.value = true;
                                await controller.updateTTD(Get.arguments,
                                    controller.exportIMage.value!);
                              },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            controller.isLoading.value
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Simpan Tanda Tangan',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
