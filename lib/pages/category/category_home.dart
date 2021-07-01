import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/pages/category/category_list.dart';
import 'package:online_shop/styles/paddings.dart';
import 'package:online_shop/widgets/custom_divider.dart';

class CategoryHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Home'),
      ),
      body: Padding(
        padding: Paddings.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextButton(
              onPressed: () => Get.to(() => CategoryList()),
              child: Text('Root Categories'),
            ),
            CustomDivider(0),

            TextButton(
              onPressed: () => null,
              child: Text('Sub Categories'),
            ),
            CustomDivider(0),
            
            TextButton(
              onPressed: () => null,
              child: Text('Leaf Categories'),
            ),
          ],
        ),
      ),
    );
  }
}
