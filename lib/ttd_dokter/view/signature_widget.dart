import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsk/ttd_dokter/controller/ttd_dokter_c.dart';
import 'package:signature/signature.dart';

class SignatureWidgetDokter extends GetView<TtdDokterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments),
        leading: IconButton(
          onPressed: () {
            controller.exportIMage.value = null;
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: GetBuilder<TtdDokterController>(
        builder: (controller) => Column(
          children: [
            Signature(
              controller: controller.signatureController,
              height: 200,
              backgroundColor: const Color.fromARGB(255, 238, 236, 236),
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
                        onPressed: controller.isLoading
                            ? null
                            : () async {
                                controller.isLoading = true;
                                await controller.updateTTD(Get.arguments,
                                    controller.exportIMage.value!);
                                controller.isLoading = false;
                              },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            controller.isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Simpan Tanda Tangan',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .primaryColorLight),
                                    ),
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
