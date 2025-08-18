import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin ToastMixin {
  void showToast(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black.withOpacity(0.8),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      forwardAnimationCurve: Curves.ease
    );
  }

  void showErrorToast(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
        forwardAnimationCurve: Curves.ease
    );
  }
}