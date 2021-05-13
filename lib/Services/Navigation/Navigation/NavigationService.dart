import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Navigation/Navigation/ANavigationService.dart';
import 'package:flutter_app/Services/ViewLocator.dart';
import 'package:flutter_app/EntryPoint.dart';


class NavigationService implements ANavigationService {

  @override
  ViewLocator viewLocator = EntryPoint.ioc.get<ViewLocator>();

  @override
    void navigate<ViewModelType>(BuildContext context) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => viewLocator.GetViewFor<ViewModelType>()));
  }
}
