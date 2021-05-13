import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Navigation/Navigation/ANavigationService.dart';
import 'package:flutter_app/ViewModels/ANavigableViewModel.dart';
import 'package:flutter_app/ViewModels/HomePageViewModel.dart';

class LoginPageViewModel implements ANavigableViewModel {

  @override
  ANavigationService navigationService;

  LoginPageViewModel({ANavigationService navigationService })  {
    this.navigationService = navigationService;
  }

  void NavigateToHomePage(BuildContext context) {
    navigationService.navigate<HomePageViewModel>(context);
  }
}
