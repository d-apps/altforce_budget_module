import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class IToastService {
  void showToast(String title, String message);
  void showErrorToast(String title, String message);
}

class ToastService implements IToastService {
  @override
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

  @override
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