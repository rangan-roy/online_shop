import 'package:flutter/material.dart';
import 'package:online_shop/widgets/horizontal_box.dart';

class Button extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function() onPressed;
  
  Button({ this.icon, this.text, this.onPressed });
  
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(3),
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if(icon != null) Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon),
              HorizontalBox(5),
            ],
          ),
          if(text != null) Text(text),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
