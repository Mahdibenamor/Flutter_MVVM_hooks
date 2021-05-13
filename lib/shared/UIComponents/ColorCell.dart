import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/utils/AppSettings.dart';

class ColorCell extends StatelessWidget {
  final Color color;

  ColorCell({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 80,
        height: 80,
        decoration: BoxDecoration(color: color),
        child: context
            .watch<AppSettings>()
            .appColor == color
            ? Icon(Icons.check_circle,
          color: Colors.white,
        ):SizedBox(),
    );
  }
}

