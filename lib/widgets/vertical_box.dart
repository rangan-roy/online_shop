import 'package:flutter/material.dart';

class VerticalBox extends StatelessWidget {
  final double height;

  VerticalBox(this.height);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: height,
    );
  }
}
