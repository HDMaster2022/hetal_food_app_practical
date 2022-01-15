class RestaurantModel {
  String? restaurantId;
  String? restaurantName;
  String? restaurantImage;
  String? tableId;
  String? tableName;
  String? branchName;
  String? nextUrl;
  List<TableMenuList>? tableMenuList;

  RestaurantModel(
      {this.restaurantId,
      this.restaurantName,
      this.restaurantImage,
      this.tableId,
      this.tableName,
      this.branchName,
      this.nextUrl,
      this.tableMenuList});

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurant_id'];
    restaurantName = json['restaurant_name'];
    restaurantImage = json['restaurant_image'];
    tableId = json['table_id'];
    tableName = json['table_name'];
    branchName = json['branch_name'];
    nextUrl = json['nexturl'];
    if (json['table_menu_list'] != null) {
      tableMenuList = <TableMenuList>[];
      json['table_menu_list'].forEach((v) {
        tableMenuList!.add(TableMenuList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurant_id'] = restaurantId;
    data['restaurant_name'] = restaurantName;
    data['restaurant_image'] = restaurantImage;
    data['table_id'] = tableId;
    data['table_name'] = tableName;
    data['branch_name'] = branchName;
    data['nexturl'] = nextUrl;
    if (tableMenuList != null) {
      data['table_menu_list'] = tableMenuList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TableMenuList {
  String? menuCategory;
  String? menuCategoryId;
  String? menuCategoryImage;
  String? nexturl;
  List<CategoryDishes>? categoryDishes;

  TableMenuList(
      {this.menuCategory,
      this.menuCategoryId,
      this.menuCategoryImage,
      this.nexturl,
      this.categoryDishes});

  TableMenuList.fromJson(Map<String, dynamic> json) {
    menuCategory = json['menu_category'];
    menuCategoryId = json['menu_category_id'];
    menuCategoryImage = json['menu_category_image'];
    nexturl = json['nexturl'];
    if (json['category_dishes'] != null) {
      categoryDishes = <CategoryDishes>[];
      json['category_dishes'].forEach((v) {
        categoryDishes!.add(CategoryDishes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menu_category'] = menuCategory;
    data['menu_category_id'] = menuCategoryId;
    data['menu_category_image'] = menuCategoryImage;
    data['nexturl'] = nexturl;
    if (categoryDishes != null) {
      data['category_dishes'] = categoryDishes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryDishes {
  String? dishId;
  String? dishName;
  double? dishPrice;
  String? dishImage;
  String? dishCurrency;
  double? dishCalories;
  String? dishDescription;
  bool? dishAvailability;
  int? dishType;
  String? nextUrl;
  int? dishQty = 0;
  List<AddonCat>? addonCat;

  CategoryDishes(
      {this.dishId,
      this.dishName,
      this.dishPrice,
      this.dishImage,
      this.dishCurrency,
      this.dishCalories,
      this.dishDescription,
      this.dishAvailability,
      this.dishType,
      this.nextUrl,
      this.dishQty,
      this.addonCat});

  CategoryDishes.fromJson(Map<String, dynamic> json) {
    dishId = json['dish_id'];
    dishName = json['dish_name'];
    dishPrice = json['dish_price'];
    dishImage = json['dish_image'];
    dishCurrency = json['dish_currency'];
    dishCalories = json['dish_calories'];
    dishDescription = json['dish_description'];
    dishAvailability = json['dish_Availability'];
    dishType = json['dish_Type'];
    nextUrl = json['nexturl'];
    if (json['addonCat'] != null && json['addonCat'] != []) {
      addonCat = <AddonCat>[];
      json['addonCat'].forEach((v) {
        addonCat!.add(AddonCat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dish_id'] = dishId;
    data['dish_name'] = dishName;
    data['dish_price'] = dishPrice;
    data['dish_image'] = dishImage;
    data['dish_currency'] = dishCurrency;
    data['dish_calories'] = dishCalories;
    data['dish_description'] = dishDescription;
    data['dish_Availability'] = dishAvailability;
    data['dish_Type'] = dishType;
    data['nexturl'] = nextUrl;
    if (addonCat != null) {
      data['addonCat'] = addonCat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddonCat {
  String? addonCategory;
  String? addonCategoryId;
  int? addonSelection;
  String? nextUrl;
  List<Addons>? addons;

  AddonCat(
      {this.addonCategory,
      this.addonCategoryId,
      this.addonSelection,
      this.nextUrl,
      this.addons});

  AddonCat.fromJson(Map<String, dynamic> json) {
    addonCategory = json['addon_category'];
    addonCategoryId = json['addon_category_id'];
    addonSelection = json['addon_selection'];
    nextUrl = json['nexturl'];
    if (json['addons'] != null && json['addons'] != []) {
      addons = <Addons>[];
      json['addons'].forEach((v) {
        addons!.add(Addons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addon_category'] = addonCategory;
    data['addon_category_id'] = addonCategoryId;
    data['addon_selection'] = addonSelection;
    data['nexturl'] = nextUrl;
    if (addons != null) {
      data['addons'] = addons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addons {
  String? dishId;
  String? dishName;
  double? dishPrice;
  String? dishImage;
  String? dishCurrency;
  double? dishCalories;
  String? dishDescription;
  bool? dishAvailability;
  int? dishType;

  Addons(
      {this.dishId,
      this.dishName,
      this.dishPrice,
      this.dishImage,
      this.dishCurrency,
      this.dishCalories,
      this.dishDescription,
      this.dishAvailability,
      this.dishType});

  Addons.fromJson(Map<String, dynamic> json) {
    dishId = json['dish_id'];
    dishName = json['dish_name'];
    dishPrice = json['dish_price'];
    dishImage = json['dish_image'];
    dishCurrency = json['dish_currency'];
    dishCalories = json['dish_calories'];
    dishDescription = json['dish_description'];
    dishAvailability = json['dish_Availability'];
    dishType = json['dish_Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dish_id'] = dishId;
    data['dish_name'] = dishName;
    data['dish_price'] = dishPrice;
    data['dish_image'] = dishImage;
    data['dish_currency'] = dishCurrency;
    data['dish_calories'] = dishCalories;
    data['dish_description'] = dishDescription;
    data['dish_Availability'] = dishAvailability;
    data['dish_Type'] = dishType;
    return data;
  }
}
