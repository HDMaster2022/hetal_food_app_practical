import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hetal_dave_practical/controller/cart_controller.dart';
import 'package:hetal_dave_practical/util/colors.dart';
import 'package:hetal_dave_practical/view/widget/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.whiteColor,
        iconTheme: const IconThemeData(color: ColorConst.greyColor),
      ),
      body: GetBuilder<CartController>(
        init: CartController(),
        builder: (cont) => Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                child: ListView.builder(
                    itemCount: cartController.cartItems.length,
                    itemBuilder: (context, index) => CartItem(
                          cartController.cartItems.values.toList()[index],
                          cartController.cartItems.keys
                              .toList()[index]
                              .toString(),
                        )),
              ),
            ),
            const Divider(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '₹${cartController.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                          color: ColorConst.whiteColor, fontSize: width * 0.04),
                    ),
                    backgroundColor: ColorConst.greenColor,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text("Order"),
                    content: const Text('Order successfully placed'),
                    actions: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: const Text('OK'),
                          onTap: () {
                            Get.back();
                            cartController.clear();
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 16),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: ColorConst.greenColor,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Text(
                  "Place Order",
                  style: TextStyle(
                      color: ColorConst.whiteColor,
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
