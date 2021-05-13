import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_app/utils/AppSettings.dart';
import 'package:provider/provider.dart';

AppBar useSearchAppBar(
    Widget titleWidget,
    Icon widgetIcon,
    Widget actionWidget,
    Icon actionIcon,){

  return use(_searchAppBarHook(
    titleWidget: titleWidget,
    widgetIcon: widgetIcon,
    actionWidget: actionWidget,
    actionIcon: actionIcon,
  ));
}
class _searchAppBarHook extends Hook<AppBar> {

  final Widget titleWidget;
  final Icon widgetIcon;
  final Widget actionWidget;
  final Icon actionIcon;

  _searchAppBarHook({
    this.titleWidget,
    this.widgetIcon,
    this.actionWidget,
    this.actionIcon,
  });

  @override
  _searchAppBarHookState createState() => _searchAppBarHookState(titleWidget,widgetIcon);
}
class _searchAppBarHookState extends HookState<AppBar, _searchAppBarHook> {

  Widget usedWidget;
  Icon usedIcon ;

  _searchAppBarHookState(Widget titleWidget ,Icon widgetIcon){
    this.usedWidget = titleWidget;
    this.usedIcon = widgetIcon;
  }

  @override
  AppBar build(BuildContext context) {

    return AppBar(
      centerTitle: true,
      title: usedWidget,
      backgroundColor: context.watch<AppSettings>().appColor,
      actions: [
        new IconButton(
            icon: usedIcon,
            onPressed:(){
              setState(() {
                if(this.usedIcon.icon == hook.widgetIcon.icon){
                  this.usedIcon = hook.actionIcon;
                  this.usedWidget = hook.actionWidget;
                }
                else {
                  this.usedIcon = hook.widgetIcon;
                  this.usedWidget = hook.titleWidget;
                }
              });
            })
      ],
    );
  }
}
