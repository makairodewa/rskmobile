import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsk/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rsk/routes/app_routes.dart';
import 'package:rsk/routes/page_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromARGB(255, 67, 75, 230),
        textTheme:
            GoogleFonts.plusJakartaSansTextTheme(Theme.of(context).textTheme),
      ),
      initialRoute: AppRoutes.INITIAL,
      getPages: AppPages.pages,
    );
  }
}
