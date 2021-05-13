import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Navigation/Navigation/ANavigationService.dart';
import 'package:flutter_app/ViewModels/ANavigableViewModel.dart';
import 'package:flutter_app/ViewModels/LoginPageViewModel.dart';

class SettingsPageViewModel implements ANavigableViewModel {

  @override
  ANavigationService navigationService;

  SettingsPageViewModel(this.navigationService) {
    this.navigationService = navigationService;
  }

  void NavigateLoginPage(BuildContext context) {
    navigationService.navigate<LoginPageViewModel>(context);
  }
}
