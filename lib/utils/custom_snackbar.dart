import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackbar(String title, String message) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM, // Customize the position
    backgroundColor: Colors.blue, // Customize the background color
    colorText: Colors.white, // Customize the text color
    duration: Duration(seconds: 3), // Customize the duration
  );
}
