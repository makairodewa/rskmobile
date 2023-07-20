import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rsk/bayi/controller/bayi_controller.dart';

class BayiDetailPage extends GetView<BayiController> {
  @override
  Widget build(BuildContext context) {
    BayiController c = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments),
        leading: IconButton(
          onPressed: () {
            c.clearImage();
            Get.back();
          },
          icon: Icon(Ionicons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<BayiController>(
          builder: (controller) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    color: const Color.fromARGB(221, 235, 232, 232),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        (controller.photoKiri != null)
                            ? Container(
                                height: 200,
                                width: Get.width / 2.5,
                                child: Image.file(
                                  controller.photoKiri!.value,
                                  fit: BoxFit.fill,
                                ),
                              )
                            : SizedBox(),
                        (controller.photoKanan != null)
                            ? Container(
                                height: 200,
                                width: Get.width / 2.5,
                                child: Image.file(
                                  controller.photoKanan!.value,
                                  fit: BoxFit.fill,
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 50,
                      width: Get.width / 2.5,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.getPhotoKiri();
                        },
                        child: const Text("Telapak Kiri"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      height: 50,
                      width: Get.width / 2.5,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.getPhotoKanan();
                        },
                        child: const Text("Telapak kanan"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 70),
                (c.photoKiri != null) && (c.photoKanan != null)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Obx(() => ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).primaryColor),
                            onPressed: controller.isLoading.value
                                ? null
                                : () async {
                                    c.isLoading.value = true;
                                    await c.updateGambar(
                                        Get.arguments,
                                        controller.photoKiri!.value,
                                        controller.photoKanan!.value);
                                  },
                            child: controller.isLoading.value == false
                                ? Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      "Simpan Gambar",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .primaryColorLight),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircularProgressIndicator(),
                                  ))),
                      )
                    : SizedBox(),
              ],
            );
          },
        ),
      ),
    );
  }
}
