import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/models/root_category.dart';
import 'package:online_shop/resources/route_names.dart';

class RootCategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Root Categories'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Get.toNamed(
          RouteNames.addEditRootCategory,
          arguments: RootCategory(),
        ),
      ),
    );
  }
}
