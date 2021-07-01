import 'package:flutter/material.dart';
import 'package:online_shop/styles/paddings.dart';
import 'package:online_shop/widgets/button.dart';
import 'package:online_shop/widgets/form_text_field.dart';
import 'package:online_shop/widgets/vertical_box.dart';

class AddEditRootCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add/Edit Root Category'),
      ),
      body: ListView(
        padding: Paddings.pagePadding,
        children: <Widget>[
          FormTextField(
            label: 'Category Name',
          ),
          VerticalBox(10),
          Button(
            icon: Icons.add,
            text: 'Add Category',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
