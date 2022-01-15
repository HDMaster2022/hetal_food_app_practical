import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:hetal_dave_practical/controller/food_order_controller.dart';

//Top TabBar Controller with GetTickerProvider
class MyTabController extends GetxController
    with GetTickerProviderStateMixin {

  late TabController controller;
  final FoodOrderController foodController = Get.put(FoodOrderController());

  @override
  void onInit() {
    super.onInit();
    getTabController();
  }

  TabController getTabController() {
    controller= TabController(vsync: this,length: foodController.items.length);
    return controller;
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
