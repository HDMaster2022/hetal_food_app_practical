import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hetal_dave_practical/controller/cart_controller.dart';
import 'package:hetal_dave_practical/controller/food_order_controller.dart';
import 'package:hetal_dave_practical/controller/tabbar_controller.dart';
import 'package:hetal_dave_practical/model/restaurant_model.dart';
import 'package:hetal_dave_practical/util/colors.dart';
import 'package:hetal_dave_practical/view/screens/cart/cart_screen.dart';
import 'package:hetal_dave_practical/view/widget/app_drawer.dart';
import 'package:hetal_dave_practical/view/widget/cart_badge.dart';
import 'package:hetal_dave_practical/view/widget/food_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomeScreen extends StatelessWidget {
  final User? user;
  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FoodOrderController controller = Get.put(FoodOrderController());
    final cartController = Get.put(CartController());
    final MyTabController myTabBar = Get.put(MyTabController());

    return GetBuilder<FoodOrderController>(
     init: FoodOrderController(),
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorConst.whiteColor,
            bottom: TabBar(
              controller: myTabBar.controller,
              isScrollable: true,
              tabs: controller.items.map((e) => Tab(text: e.menuCategory)).toList(),
              indicatorColor: ColorConst.redColor,
              labelColor: ColorConst.redColor,
              unselectedLabelColor: ColorConst.blackColor,
            ),
            actions: <Widget>[
              GetBuilder<CartController>(
                  init: CartController(),
                  builder: (context) {
                    return CartBadge(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 14.0),
                        child: InkWell(
                            child: const Icon(
                              Icons.shopping_cart,
                              color: ColorConst.greyColor,
                            ),
                            onTap: () {
                              Get.to(() => const CartScreen());
                            }),
                      ),
                      value: cartController.itemCount.toString(),
                      color: ColorConst.redColor,
                    );
                  })
            ],
            iconTheme: const IconThemeData(color: ColorConst.greyColor),
          ),
          drawer:  AppDrawer(user:user),
          body: !controller.loading.value && controller.items.length>0?
           TabBarView(
            controller: myTabBar.controller,
            children: controller.items.map((TableMenuList e) {
              return FoodItemWidget(e.categoryDishes, e.menuCategoryId);
            }).toList(),
          ):const Center(child: CircularProgressIndicator()),
        );
      }
    );
  }
}
