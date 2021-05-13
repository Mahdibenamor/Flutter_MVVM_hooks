import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

PreferredSize useCustomIAppBar({
    Widget child,
    double height,
    Color color}){

  return use(_customIAppBarHook(
      child: child,
      height: height,
      color: color));
}

class _customIAppBarHook extends Hook<PreferredSize> {
  //
  final Widget child;
  final double height;
  final Color color;

  _customIAppBarHook({@required this.child , this.height = kToolbarHeight, this.color});

  @override
  _customIAppBarHookState createState() => _customIAppBarHookState();
}

class _customIAppBarHookState extends HookState<PreferredSize, _customIAppBarHook> {

  _iAppBarHookState(){}
  @override
  Size get preferredSize => Size.fromHeight(80);

  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        height: preferredSize.height,
        color: hook.color ?? Colors.red,
        alignment: Alignment.center,
        child: hook.child,
      ),
    );
  }

}

