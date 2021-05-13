import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_app/utils/AppSettings.dart';
import 'package:provider/provider.dart';

Widget useConvexBottomBar(
    List<TabItem<dynamic>> items,
    Color activeColor){

  return use(_convexBottomBarHook(
      items: items,
      activeColor: activeColor));
}
class _convexBottomBarHook extends Hook<Widget> {

  final List<TabItem<dynamic>> items;
  final Color activeColor;
  _convexBottomBarHook({@required this.items, this.activeColor});

  @override
  _convexBottomBarHookState createState() => _convexBottomBarHookState();
}
class _convexBottomBarHookState extends HookState<Widget, _convexBottomBarHook> {

  int selectedIndex = 0;

  _convexAppBarHookState(){}

  @override
  Widget build(BuildContext context) {

    return ConvexAppBar.badge({3: '21+'},
      items:hook.items,
      onTap: onItemTapped,
      activeColor: hook.activeColor,
      backgroundColor: context.watch<AppSettings>().appColor,
    );
  }
  void onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }
}
