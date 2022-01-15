import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:hetal_dave_practical/controller/food_order_controller.dart';
import 'package:hetal_dave_practical/services/firebase_service.dart';
import 'package:hetal_dave_practical/util/colors.dart';
import 'package:hetal_dave_practical/view/screens/auth/signin_screen.dart';

class AppDrawer extends StatelessWidget {
  final User? user;

  const AppDrawer({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FoodOrderController controller = Get.put(FoodOrderController());

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
              child: Column(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(180.0)),
                  child: CachedNetworkImage(
                    imageUrl: user!.photoURL!,
                    fit: BoxFit.cover,
                    width: width * 0.24,
                    height: width * 0.24,
                  )),
              SizedBox(height: height * 0.01),
              Text(
                user!.displayName!,
                style: TextStyle(
                  fontSize: width * 0.038,
                  color: ColorConst.blackColor,
                ),
              ),
              SizedBox(height: height * 0.006),
              Expanded(
                child: Text(
                  user!.uid,
                  style: TextStyle(
                    fontSize: width * 0.038,
                    color: ColorConst.blackColor,
                  ),
                ),
              )
            ],
          )),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () async {
              controller.toggleLoading();
              await Authentication.signOut(context: context).then((value) =>
                  {controller.toggleLoading(), Get.to(SignInScreen())});
            },
          ),
        ],
      ),
    );
  }
}
