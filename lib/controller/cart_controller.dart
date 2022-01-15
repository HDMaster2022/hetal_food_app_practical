import 'dart:core';
import 'package:get/get.dart';
import 'package:hetal_dave_practical/model/restaurant_model.dart';

//Cart Controller (for Cart operation)
class CartController extends GetxController {
  Map<String, CategoryDishes> cartItems = {};

  //Cart Item Count
  int get itemCount {
    return cartItems.length;
  }

  //Total Order Amount
  double get totalAmount {
    var total = 0.0;
    cartItems.forEach((key, cartItem) {
      total += cartItem.dishPrice! * cartItem.dishQty!;
    });
    return total;
  }

  //Add item into cart
  void addItem(CategoryDishes dishModel) {
    if (cartItems.containsKey(dishModel.dishId)) {
      cartItems.update(dishModel.dishId!, (existingCartItem) => dishModel);
    } else {
      cartItems.putIfAbsent(dishModel.dishId!, () => dishModel);
    }
    update();
  }

  //Remove item from cart
  void removeItem(String dishId, CategoryDishes dishModel) {
    if (cartItems[dishId]!.dishQty! < 1) {
      cartItems.remove(dishId);
    } else {
      cartItems.update(dishId, (existingCartItem) => dishModel);
    }
    update();
  }

  //Clear Cart when order placed
  void clear() {
    cartItems = {};
    update();
  }
}
