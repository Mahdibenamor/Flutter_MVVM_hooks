import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_app/views/IBindablePage.dart';

class BasePage extends HookWidget with IBindablePage {
  BasePage();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  void setState(VoidCallback fn) {
    fn();
  }
}
