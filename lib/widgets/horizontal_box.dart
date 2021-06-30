import 'package:flutter/material.dart';

class HorizontalBox extends StatelessWidget {
  final double width;

  HorizontalBox(this.width);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
