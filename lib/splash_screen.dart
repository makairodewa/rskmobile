import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsk/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  final String? token;
  SplashPage({this.token});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    if (widget.token != null && widget.token!.isNotEmpty) {
      Future.delayed(
          const Duration(seconds: 2), () => Get.offNamed(AppRoutes.HOME));
    } else {
      Future.delayed(
          const Duration(seconds: 2), () => Get.offNamed(AppRoutes.AUTH));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon/icon.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
