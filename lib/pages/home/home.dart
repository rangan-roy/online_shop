import 'package:flutter/material.dart';
import 'package:online_shop/resources/route_names.dart';
import 'package:online_shop/styles/paddings.dart';
import 'package:online_shop/widgets/custom_divider.dart';
import 'package:online_shop/widgets/horizontal_box.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        padding: Paddings.pagePadding,
        children: <Widget>[
          getHomeButton(
            icon: Icons.category,
            text: 'Categories',
            routeName: RouteNames.categoryHome,
          ),
        ],
      ),
    );
  }

  Column getHomeButton({IconData icon, String text, String routeName, 
      bool hasDivider = true}) {
    return Column(
      children: <Widget>[
        TextButton(
          child: Row(
            children: <Widget>[
              Icon(icon),
              HorizontalBox(10),
              Text(text),
            ],
          ),
          onPressed: () => Get.toNamed(routeName),
        ),
        if(hasDivider) CustomDivider(0),
      ],
    );
  }
}
