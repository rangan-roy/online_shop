import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double height;

  CustomDivider(this.height);
  
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
    );
  }
}
