import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsk/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.offNamed(AppRoutes.AUTH),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icon/icon.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
