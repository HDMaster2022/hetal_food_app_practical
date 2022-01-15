import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hetal_dave_practical/controller/cart_controller.dart';
import 'package:hetal_dave_practical/model/restaurant_model.dart';
import 'package:hetal_dave_practical/util/colors.dart';
import 'package:hetal_dave_practical/util/image_constant.dart';

class CartItem extends StatelessWidget {
  final CategoryDishes dishModel;
  final String id;

  CartItem(this.dishModel, this.id);

  @override
  Widget build(BuildContext context) {
    var cartController = Get.put(CartController());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(ImageConstant.VEG_FOOF_ICON),
            height: height * 0.02,
          ),
          SizedBox(width: width * 0.02),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Product Title
                      Text(
                        dishModel.dishName!,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      //Product Price
                      Text(
                        dishModel.dishPrice.toString(),
                        style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w600),
                      ),
                      //Product calories
                      Text(
                        dishModel.dishCalories.toString() + " calories",
                        style: TextStyle(
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),

                //Product Add to cart buttons
                GetBuilder<CartController>(
                    init: CartController(),
                    builder: (cont) {
                      return Container(
                        height: height * 0.05,
                        width: width * 0.3,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: ColorConst.greenColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: height * 0.02,
                              padding: EdgeInsets.zero,
                              icon: const Icon(
                                Icons.remove,
                                color: ColorConst.whiteColor,
                              ),
                              onPressed: () {
                                if (dishModel.dishQty! > 0) {
                                  dishModel.dishQty = dishModel.dishQty! - 1;
                                  cartController.removeItem(
                                      dishModel.dishId!, dishModel);
                                }
                              },
                            ),
                            Text(
                              dishModel.dishQty.toString(),
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w700,
                                  color: ColorConst.whiteColor),
                            ),
                            IconButton(
                              iconSize: height * 0.02,
                              padding: EdgeInsets.zero,
                              icon: const Icon(
                                Icons.add,
                                color: ColorConst.whiteColor,
                              ),
                              onPressed: () {
                                dishModel.dishQty = dishModel.dishQty! + 1;
                                cartController.addItem(dishModel);
                              },
                            ),
                          ],
                        ),
                      );
                    }),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Text(
                    (dishModel.dishPrice! * dishModel.dishQty!).toString(),
                    style: TextStyle(
                        fontSize: width * 0.04, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
