import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:hetal_dave_practical/controller/tabbar_controller.dart';
import 'package:hetal_dave_practical/model/restaurant_model.dart';
import 'package:hetal_dave_practical/services/restaurant_service.dart';

//Order controller for get dish list & item operations
class FoodOrderController extends GetxController {
  final List<RestaurantModel> _foodDishList = [];
  //Use loading when async data is loading
  var loading = true.obs;
  List<TableMenuList> items = <TableMenuList>[];

  @override
  void onInit() {
    super.onInit();
    // Fetch Restaurant list from API
    getData();
  }

  Future<void> getData() async {
    loading.value = true;
    _foodDishList.clear();
    var getItems = await RestaurantServices.fetchItems();
    loading.value = false;
    if (getItems != null) {
      getItems.forEach((item) {
        _foodDishList.add(RestaurantModel.fromJson(item));
      });
      items = _foodDishList[0].tableMenuList!;
      final MyTabController myTabBarController = Get.put(MyTabController());
      myTabBarController.getTabController();

      update();
    }
  }

  void toggleLoading() {
    loading.value = !loading.value;
    update();
  }
}
