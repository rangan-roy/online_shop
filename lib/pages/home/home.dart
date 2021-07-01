import 'package:flutter/material.dart';
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
        padding: EdgeInsets.all(20),
        children: <Widget>[
          getHomeButton(
            icon: Icons.category,
            text: 'Categories',
            page: null,
          ),
        ],
      ),
    );
  }

  Column getHomeButton({IconData icon, String text, Widget page, 
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
          onPressed: () => Get.to(page),
        ),
        Divider(
          height: 0,
        ),
      ],
    );
  }
}
