import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsk/auth/controller/Auth_c.dart';
import 'package:rsk/routes/app_routes.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(height: 32),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xFFF6F6F6),
                      ),
                      child: TextFormField(
                        controller: controller.username,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Username",
                          hintStyle: TextStyle(
                            color: Color(0xffBDBDBD),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xFFF6F6F6),
                      ),
                      child: Obx(
                        () => TextFormField(
                          obscureText: controller.isobscureText.value,
                          controller: controller.password,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: const TextStyle(
                              color: Color(0xffBDBDBD),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.showPassword();
                              },
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                    SizedBox(
                      height: 51,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor),
                        onPressed: () {
                          Get.offAllNamed(AppRoutes.HOME);
                        },
                        child: Text("Log In",
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColorLight,
                            )),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {},
                      child: Text("Lupa password?",
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                          )),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
