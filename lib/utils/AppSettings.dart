import 'package:flutter/material.dart';
import 'package:flutter_app/utils/Constants.dart';

class AppSettings extends ChangeNotifier{

  Color _appColor = Colors.teal;

  Color get appColor => _appColor;

  static List<Color> colors = [
    Colors.black87,
    Colors.blue,
    Colors.purple,
    Colors.indigo,
    Colors.green,
    Colors.teal,
    Colors.red,
    Colors.amber,
    Colors.brown,
    Colors.deepOrange,
  ];

  void updateColor(int index){
    _appColor = Constants.colors[index];
    notifyListeners();
  }
}