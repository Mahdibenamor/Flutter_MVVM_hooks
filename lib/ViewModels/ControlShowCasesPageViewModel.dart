import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Navigation/Navigation/ANavigationService.dart';
import 'package:flutter_app/ViewModels/ANavigableViewModel.dart';
import 'package:flutter_app/ViewModels/ControlShowCasesPageViewModel.dart';

class ControlShowCasesPageViewModel implements ANavigableViewModel {

  @override
  ANavigationService navigationService;

  ControlShowCasesPageViewModel(this.navigationService)  {
    this.navigationService = navigationService;
  }

  void NavigateToControlShowCasesPage(BuildContext context) {
    navigationService.navigate<ControlShowCasesPageViewModel>(context);
  }
}
