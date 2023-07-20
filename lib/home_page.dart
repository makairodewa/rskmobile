import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rsk/models/category_model.dart';
import 'package:rsk/routes/app_routes.dart';

class HomePage extends StatefulWidget {
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

  void _logout() async {
    final storage = GetStorage();
    storage.remove('token');
    storage.remove('isRememberMe');
    Get.offNamed(AppRoutes.AUTH);
  }

  @override
  Widget build(BuildContext context) {
    // Get.put(BayiController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("RS Karitas"),
        centerTitle: true,
        elevation: 0,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 'logout') {
                _logout();
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'logout',
                  child: const Text('Logout'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
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
