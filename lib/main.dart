import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/pages/category/add_edit_root_category.dart';
import 'package:online_shop/pages/category/category_home.dart';
import 'package:online_shop/pages/category/root_category_list.dart';
import 'package:online_shop/pages/home/home.dart';
import 'package:online_shop/resources/route_names.dart';

void main() {
  runApp(OnlineShop());
}

class OnlineShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.home,
      getPages: getPages,
    );
  }

  final List<GetPage> getPages = <GetPage>[
    GetPage(
      name: RouteNames.home,
      page: () => Home(),
    ),
    GetPage(
      name: RouteNames.categoryHome,
      page: () => CategoryHome(),
    ),
    GetPage(
      name: RouteNames.rootCategoryList,
      page: () => RootCategoryList(),
    ),
    GetPage(
      name: RouteNames.addEditRootCategory,
      page: () => AddEditRootCategory(),
    )
  ];
}
