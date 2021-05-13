import 'package:flutter_app/EntryPoint.dart';
import 'package:flutter_app/views/BasePage.dart';
import 'package:flutter_app/views/HomeViewPage.dart';
import 'package:flutter_app/views/LoginViewPage.dart';
import 'package:flutter_app/views/SettingsViewPage.dart';
import 'package:flutter_app/views/ControlShowCasesViewPage.dart';
import 'package:flutter_app/ViewModels/ANavigableViewModel.dart';
import 'package:flutter_app/ViewModels/HomePageViewModel.dart';
import 'package:flutter_app/ViewModels/SettingsPageViewModel.dart';
import 'package:flutter_app/ViewModels/ControlShowCasesPageViewModel.dart';
import 'package:flutter_app/ViewModels/LoginPageViewModel.dart';
import 'package:flutter_app/Services/ProviderLocator.dart';
import 'package:flutter_app/Services/Navigation/Navigation/NavigationService.dart';

class ViewLocator{

  Map<Type, Type> ViewLocatorDictionary;

  BasePage GetViewFor<ViewModelType>(){
    switch (ViewModelType) {
      case HomePageViewModel:
        {
          BasePage page = HomeViewPage();
          page.BindingContext = GetViewModelForView<HomePageViewModel>();
          return page;
        }
      case LoginPageViewModel:
        {
          BasePage page = LoginViewPage();
          page.BindingContext = GetViewModelForView<LoginPageViewModel>();
          return page;
        }
      case SettingsPageViewModel:
        {
          BasePage page = SettingsViewPage();
          page.BindingContext = GetViewModelForView<SettingsPageViewModel>();
          return page;
        }
      case ControlShowCasesPageViewModel:
        {
          BasePage page = ControlShowCasesViewPage();
          page.BindingContext = GetViewModelForView<ControlShowCasesPageViewModel>();
          return page;
        }
        break;
    }
  }

  ANavigableViewModel GetViewModelForView<ViewModelType>({List<Type> services}){
    ProviderLocator services = EntryPoint.ioc.get<ProviderLocator>();

    switch (ViewModelType) {
      case HomePageViewModel:
          return new HomePageViewModel(services.GetSerive<NavigationService>());
      case LoginPageViewModel:
            return new LoginPageViewModel(navigationService: services.GetSerive<NavigationService>());
      case SettingsPageViewModel:
            return new SettingsPageViewModel(services.GetSerive<NavigationService>());
      case ControlShowCasesPageViewModel:
          return new ControlShowCasesPageViewModel(services.GetSerive<NavigationService>());
        break;
    }
  }


}