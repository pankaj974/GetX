import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getx/pages/home_page.dart' show HomePage;

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;

  void login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email and password are required");
      return;
    }

    isLoading.value = true;

    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      isLoading.value = false;

      // Navigate to HomePage and pass the user
      Get.offAll(() => HomePage(user: userCredential.user!));
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      Get.snackbar("Login Failed", e.message ?? "Unknown error");
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
