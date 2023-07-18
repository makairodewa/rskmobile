import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsk/controller/bayi_controller.dart';
import 'package:rsk/controller/resume_controller.dart';
import 'package:rsk/models/category_model.dart';
import 'package:rsk/services/bayi_service.dart';
import 'package:rsk/services/resume_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];

  void _getCategories() {
    categories = CategoryModel.getCategory();
  }

  @override
  void initState() {
    super.initState();
    _getCategories();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ResumeApi());
    Get.put(BayiApi());
    Get.put(ResumeController());
    Get.put(BayiController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("RS Karitas"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // const SizedBox(height: 30),
            // Container(
            //   height: 70,
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(57),
            //     color: const Color(0xFFF9FAFE),
            //   ),
            //   child: Center(
            //     child: TextField(
            //       decoration: InputDecoration(
            //         icon:
            //             Icon(Icons.search, color: Colors.black.withOpacity(.3)),
            //         hintText: "Search....",
            //         hintStyle: TextStyle(color: Colors.black.withOpacity(.3)),
            //         border: InputBorder.none,
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                shrinkWrap: true,
                children: List.generate(
                  categories.length,
                  (index) {
                    return Material(
                      borderRadius: BorderRadius.circular(30),
                      child: InkWell(
                        radius: 30,
                        onTap: () {
                          categories[index].onMoreTapped(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color:
                                    categories[index].boxColor.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(30)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(categories[index].path),
                                    ),
                                  ),
                                ),
                                Text(categories[index].title)
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
