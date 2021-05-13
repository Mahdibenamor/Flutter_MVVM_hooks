
import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Navigation/Navigation/ANavigationService.dart';
import 'package:flutter_app/ViewModels/ANavigableViewModel.dart';
import 'package:flutter_app/ViewModels/SettingsPageViewModel.dart';


class HomePageViewModel implements ANavigableViewModel {

  @override
  ANavigationService navigationService;

  HomePageViewModel(this.navigationService) {
    this.navigationService = navigationService;
  }

  void NavigateToSettingsPage(BuildContext context) {
    navigationService.navigate<SettingsPageViewModel>(context);
  }
}
