import 'package:get_it/get_it.dart';

import 'package:flutter_app/Services/Navigation/Navigation/ANavigationService.dart';
import 'package:flutter_app/Services/Navigation/Navigation/NavigationService.dart';

// import of the views of the current app
import 'package:flutter_app/views/HomeViewPage.dart';
import 'package:flutter_app/views/LoginViewPage.dart';
import 'package:flutter_app/views/SettingsViewPage.dart';
import 'package:flutter_app/views/ControlShowCasesViewPage.dart';

// import of the ViewModel of all the views for the current app
import 'package:flutter_app/ViewModels/HomePageViewModel.dart';
import 'package:flutter_app/ViewModels/LoginPageViewModel.dart';
import 'package:flutter_app/ViewModels/SettingsPageViewModel.dart';
import 'package:flutter_app/ViewModels/ControlShowCasesPageViewModel.dart';
import 'package:flutter_app/Services/ViewLocator.dart';
import 'package:flutter_app/Services/ProviderLocator.dart';

/*to add a new page :
    1- *create to viewModel class with service to inject in the constructeur
    2- *create the view class
    3- *add the view and the viewModel in the viewLocator Map
    4- *register the services needed in the PROVIDER_LOCATOR
    5- * because flutter dont support a reliable reflection, you have to update in
       the GetViewFor and the GetViewModelForView methods in the ViewLocator inorder
       to ensure the navigation.
       *when creating a new page we should set the BindingContext to view
*/
class EntryPoint {
  EntryPoint();
  static GetIt ioc = GetIt();


  static void RegisterDependencies() {
    registerViewLocator();
    registerServicesLocator();
  }
  static void registerViewLocator() {

    ViewLocator viewLocator = ViewLocator();
    Map<Type, Type> viewLocatorDict = Map<Type, Type>();

    viewLocatorDict[HomePageViewModel] = HomeViewPage;
    viewLocatorDict[LoginPageViewModel] = LoginViewPage;
    viewLocatorDict[SettingsPageViewModel] = SettingsViewPage;
    viewLocatorDict[ControlShowCasesPageViewModel] = ControlShowCasesViewPage;
    viewLocator.ViewLocatorDictionary = viewLocatorDict;
    ioc.registerSingleton<ViewLocator>(viewLocator);
  }

  static void registerServicesLocator() {

    // --ProviderLocator
    // hold the instance for app's services
    ProviderLocator providerLocator =  ProviderLocator();

    providerLocator.AddSerivce(NavigationService, new NavigationService());

    ioc.registerSingleton<ProviderLocator>(providerLocator);
  }

}
