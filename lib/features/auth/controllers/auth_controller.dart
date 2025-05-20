import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  
  final isLoading = false.obs;
  final userAvatar = ''.obs;
  String userName = '';

  void validateEmail() {
    if (emailController.text.isNotEmpty) {
      // Implement your email validation logic here
      Get.toNamed('/password');
    }
  }

  void login() {
    if (passwordController.text.isNotEmpty) {
      // Implement your login logic here
      Get.offAllNamed('/home');
    }
  }

  void createAccount() {
    if (emailController.text.isNotEmpty && 
        passwordController.text.isNotEmpty && 
        phoneController.text.isNotEmpty) {
      // Implement your account creation logic here
      Get.offAllNamed('/home');
    }
  }

  void notYou() {
    emailController.clear();
    passwordController.clear();
    Get.back();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}