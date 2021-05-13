import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_app/utils/AppSettings.dart';
import 'package:provider/provider.dart';



Widget useCustomButton({
    Function onPressed,
    String text,
    Color borderColor,
    Color textColor,
    Color iconColor,
    Color backgroundColor,
    IconData prefixIcon}){

  return use(_customButtonHook(
      onPressed: onPressed,
      text:text,
      borderColor: borderColor,
      textColor: textColor,
      prefixIcon: prefixIcon,
      iconColor: iconColor,
      backgroundColor: backgroundColor,
  ));
}

class _customButtonHook extends  Hook<Widget> {

  final Function onPressed;
  final String text;
  final Color borderColor;
  final Color textColor;
  final Color iconColor;
  final Color backgroundColor;
  final IconData prefixIcon;


  _customButtonHook({
    this.onPressed,
    this.text,
    this.borderColor,
    this.textColor,
    this.prefixIcon,
    this.iconColor,
    this.backgroundColor
  });

  @override
  _customButtonHookState createState() => _customButtonHookState();
}

class _customButtonHookState extends HookState<Widget, _customButtonHook> {

  _customButtonHookState();

  @override
  Widget build(BuildContext context) {

    return Container(
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.875,
        height: 48.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                side: BorderSide(color: hook.borderColor == null ? Color.fromRGBO(0, 160, 227, 1): hook.borderColor)),
            onPressed: hook.onPressed,
            padding: EdgeInsets.all(10.0),
            color: hook.backgroundColor == null ?  Colors.white : hook.backgroundColor,
            textColor: hook.textColor == null ? Color.fromRGBO(0, 160, 227, 1): hook.textColor ,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(hook.prefixIcon == null ? Icons.bug_report : hook.prefixIcon,
                  color: hook.iconColor == null ? Colors.black: hook.iconColor,),
                Text(hook.text, ),
              ],
            ),
          ),
        )
    );
  }
}

