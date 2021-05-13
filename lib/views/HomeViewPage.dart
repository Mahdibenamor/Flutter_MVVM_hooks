import 'package:flutter/material.dart';
import 'package:flutter_app/shared/AppBar/AppBar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/utils/AppSettings.dart';
import 'package:flutter_app/utils/Utils.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_app/shared/ConvexBottomBar/CustomConvexBottomBar.dart';
import 'package:flutter_app/views/BasePage.dart';

class HomeViewPage extends  BasePage{
//
  HomeViewPage();
  int selectedIndex = 0;

  void _initState(BuildContext context)async {
    _initTheme(context);
  }
  void _initTheme(BuildContext context) async {
    int themeIndex = await Utils.getThemeIndex();
    context.read<AppSettings>().updateColor(themeIndex);
  }
  @override
  Widget build(BuildContext context) {
    final convexBottombar = useConvexBottomBar([
      TabItem(icon: Icons.home, title: 'Home'),
      TabItem(icon: Icons.games, title: 'Games'),
      TabItem(icon: Icons.apps, title: 'Apps'),
      TabItem(icon: Icons.movie, title: 'Movies'),
      TabItem(icon: Icons.book, title: 'Books'),
    ],
        Colors.lime);
    _initState(context);
    final testAppBar = useCustomIAppBar(
      color: context.watch<AppSettings>().appColor,
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text("HOME", textAlign: TextAlign.center),
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              BindingContext.NavigateToSettingsPage(context);
            },
          )
        ],
      ),
    );
    return Scaffold(
      appBar: testAppBar,
      bottomNavigationBar:
      convexBottombar,
    );
  }
  void onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }
}
