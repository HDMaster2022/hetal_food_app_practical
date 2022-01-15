import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hetal_dave_practical/util/colors.dart';

void showCustomSnackBar(String message, {bool isError = true}) {
  ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(SnackBar(
    backgroundColor: isError ? ColorConst.redColor : ColorConst.greenColor,
    content: Text(message),
  ));
}
