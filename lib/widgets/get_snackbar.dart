import 'package:flutter/material.dart';
import 'package:get/get.dart';

void getSnackbar(String title, String message) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    margin: EdgeInsets.all(20),
  );
}
