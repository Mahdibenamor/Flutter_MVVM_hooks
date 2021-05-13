import 'package:flutter/material.dart';

class CustomLinkButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;

  CustomLinkButton({
    this.onPressed,
    this.text,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: color),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
