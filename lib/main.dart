import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/utils/AppSettings.dart';
import 'package:flutter_app/EntryPoint.dart';
import 'package:flutter_app/ViewModels/LoginPageViewModel.dart';
import 'package:flutter_app/Services/ViewLocator.dart';


// to add a new page go to CoreEntryPoint file.
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  EntryPoint.RegisterDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  MyApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AppSettings(),
          )
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.green,
                visualDensity: VisualDensity.adaptivePlatformDensity),
            home: EntryPoint.ioc.get<ViewLocator>().GetViewFor<LoginPageViewModel>()
        ));
  }
}
