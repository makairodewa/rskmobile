import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsk/routes/app_routes.dart';
import 'package:rsk/routes/page_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  var storage = GetStorage();
  bool? isRememberMe = storage.read('isRememberMe');
  runApp(MyApp(isRememberMe));
}

class MyApp extends StatelessWidget {
  final bool? isRememberMe;
  MyApp(this.isRememberMe, {Key? key}) : super(key: key);

  String determineInitialRoute() {
    // Check if the token is available and not empty
    if (isRememberMe == true) {
      return AppRoutes.HOME; // Navigate to the Home page
    } else {
      return AppRoutes.AUTH; // Navigate to the Authentication page
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Rsk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 67, 75, 230),
        textTheme:
            GoogleFonts.plusJakartaSansTextTheme(Theme.of(context).textTheme),
        useMaterial3: true,
      ),
      locale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      initialRoute: determineInitialRoute(),
      getPages: AppPages.pages,
    );
  }
}
