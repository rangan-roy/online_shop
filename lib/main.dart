import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/pages/category/category_home.dart';
import 'package:online_shop/pages/home/home.dart';
import 'package:online_shop/resources/route_names.dart';

void main() {
  runApp(OnlineShop());
}

class OnlineShop extends StatelessWidget {
  final List<GetPage> getPages = <GetPage>[
    GetPage(
      name: RouteNames.home,
      page: () => Home(),
    ),
    GetPage(
      name: RouteNames.categoryHome,
      page: () => CategoryHome(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.home,
      getPages: getPages,
    );
  }
}
