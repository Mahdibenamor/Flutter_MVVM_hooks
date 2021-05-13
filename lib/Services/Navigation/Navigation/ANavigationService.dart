import 'package:flutter/material.dart';
import 'package:flutter_app/Services/ViewLocator.dart';
import 'package:flutter_app/Services/IService.dart';

// interface that hold the navigation system

abstract class ANavigationService extends IService {

  ViewLocator viewLocator;
  void navigate<T>(BuildContext context);

}