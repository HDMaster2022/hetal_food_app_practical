import 'package:cached_network_image/cached_network_image.dart';
import 'package:hetal_dave_practical/controller/cart_controller.dart';
import 'package:hetal_dave_practical/controller/food_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hetal_dave_practical/model/restaurant_model.dart';
import 'package:hetal_dave_practical/util/colors.dart';
import 'package:hetal_dave_practical/util/image_constant.dart';

class FoodItemWidget extends StatelessWidget {
  final controller = Get.put(FoodOrderController());
  final cartController = Get.put(CartController());

  final List<CategoryDishes>? categoryDishes;
  final String? menuCategoryId;

  FoodItemWidget(this.categoryDishes, this.menuCategoryId);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: categoryDishes!.length,
      itemBuilder: (context, index) {
        return GetBuilder<FoodOrderController>(
          init: FoodOrderController(),
          builder: (value) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: AssetImage(ImageConstant.VEG_FOOF_ICON),
                      height: height * 0.02,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Product Title
                          Text(
                            categoryDishes![index].dishName!,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.bold),
                          ),
                          //Product Price & Cal
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "INR " +
                                    categoryDishes![index].dishPrice.toString(),
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                categoryDishes![index].dishCalories.toString() +
                                    " calories",
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          //Product Description
                          Text(
                            categoryDishes![index].dishDescription!,
                            style: TextStyle(
                                fontSize: width * 0.036,
                                color: ColorConst.greyColor),
                          ),
                          const SizedBox(height: 10),
                          //Product Add to cart buttons
                          GetBuilder<CartController>(
                              init: CartController(),
                              builder: (cont) {
                                return Container(
                                  height: 36,
                                  width: 110,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      color: ColorConst.greenColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        iconSize: 16,
                                        padding: EdgeInsets.zero,
                                        icon: const Icon(
                                          Icons.remove,
                                          color: ColorConst.whiteColor,
                                        ),
                                        onPressed: () {
                                          if (categoryDishes![index].dishQty! >
                                              0) {
                                            categoryDishes![index].dishQty =
                                                categoryDishes![index]
                                                        .dishQty! -
                                                    1;
                                            cartController.removeItem(
                                                categoryDishes![index].dishId!,
                                                categoryDishes![index]);
                                          }
                                        },
                                      ),
                                      Text(
                                        categoryDishes![index]
                                            .dishQty
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: width * 0.04,
                                            fontWeight: FontWeight.w700,
                                            color: ColorConst.whiteColor),
                                      ),
                                      IconButton(
                                        iconSize: 16,
                                        padding: EdgeInsets.zero,
                                        icon: const Icon(
                                          Icons.add,
                                          color: ColorConst.whiteColor,
                                        ),
                                        onPressed: () {
                                          categoryDishes![index].dishQty =
                                              categoryDishes![index].dishQty! +
                                                  1;
                                          cartController
                                              .addItem(categoryDishes![index]);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              }),

                          const SizedBox(height: 10),
                          //Customizations
                          categoryDishes![index].addonCat!.isNotEmpty
                              ? const Text(
                                  "Customizations Available",
                                  style: TextStyle(color: ColorConst.redColor),
                                )
                              : Container()
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    //Product Image
                    CachedNetworkImage(
                      height: height*0.07,
                      width: height*0.07,
                      imageUrl: categoryDishes![index].dishImage!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                       const CircularProgressIndicator(),/* Image(
                        image: AssetImage(ImageConstant.FIREBASE_SYMBOL),
                        height: height*0.07,
                        width: height*0.07,
                      ),*/
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ],
                ),
                const Divider()
              ],
            ),
          ),
        );
      },
    );
  }
}
