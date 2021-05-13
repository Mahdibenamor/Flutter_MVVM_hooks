import 'package:flutter/material.dart';
import 'package:flutter_app/utils/AppSettings.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Widget useCustomTextFeild(
    {Duration animationDuration,
    double width,
    double height,
    TextStyle textStyle,
    String hintText,
    bool isPassword,
    TextInputType inputType,
    TextInputAction textInputAction,
    IconData prefixIcon,
    IconData suffixIcon,
    int maxLength,
    int minLines,
    int maxLines,
    ValueChanged<String> onChanged,
    ValueChanged<String> onSubmitted,
    bool enabled,
    GestureTapCallback onTap}) {
  return use(_customTextFeildHook(
      width: width,
      height: height,
      textStyle: textStyle,
      hintText: hintText,
      isPassword: isPassword,
      inputType: inputType,
      textInputAction: textInputAction,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      enabled: enabled,
      onTap: onTap));
}

class _customTextFeildHook extends Hook<Widget> {
  final Duration animationDuration = Duration(milliseconds: 500);
  final double width;
  final double height;
  final TextStyle textStyle;
  final String hintText;
  final bool isPassword;
  final TextInputType inputType;
  final TextInputAction textInputAction;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final int maxLength, minLines, maxLines;
  final ValueChanged<String> onChanged, onSubmitted;
  final bool enabled;
  final GestureTapCallback onTap;

  _customTextFeildHook(
      {this.width,
      this.height,
      this.textStyle,
      this.hintText,
      this.isPassword,
      this.inputType,
      this.textInputAction,
      this.prefixIcon,
      this.suffixIcon,
      this.maxLength,
      this.minLines,
      this.maxLines,
      this.onChanged,
      this.onSubmitted,
      this.enabled,
      this.onTap});

  @override
  _customTextFeildHookState createState() => _customTextFeildHookState();
}

class _customTextFeildHookState
    extends HookState<Widget, _customTextFeildHook> {
  FocusNode focusNode = FocusNode();
  TextEditingController controller = TextEditingController();

  _customTextFeildHookState();

  @override
  Widget build(BuildContext context) {
    return Center(
      // animates the textformfield
      child: AnimatedContainer(
        width: hook.width,
        height: hook.height,
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              // has the effect of softening the shadow
              blurRadius: 1.0,
              // has the effect of extending the shadow
              spreadRadius: 0.5,
              offset: Offset(
                0.0,
                0.0,
              ),
            )
          ],
          // gives the widget rounded corners
          borderRadius: focusNode.hasFocus
              ? BorderRadius.all(Radius.circular(8))
              : BorderRadius.all(Radius.circular(14)),
          // defines the color of the widget
          color: focusNode.hasFocus ? Colors.white : Color(0xFFEEEEEE),
        ),
        duration: hook.animationDuration,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFormField(
            decoration: new InputDecoration(
              border: InputBorder.none,
              hintText: hook.hintText,
              hintStyle: hook.textStyle,
              prefixIcon: hook.prefixIcon == null
                  ? null
                  : Icon(hook.prefixIcon,
                      color: context.watch<AppSettings>().appColor),
              suffix: hook.suffixIcon == null
                  ? null
                  : Icon(hook.suffixIcon,
                      color: context.watch<AppSettings>().appColor),
            ),
            style: hook.textStyle,
            controller: controller,
            obscureText: hook.isPassword,
            keyboardType:
                hook.inputType == null ? TextInputType.text : hook.inputType,
            autofocus: false,
            autocorrect: false,
            focusNode: focusNode,
            enabled: hook.enabled,
            maxLength: hook.maxLength,
            maxLines: hook.maxLines,
            minLines: hook.minLines,
            onChanged: hook.onChanged,
            onTap: () {
              if (hook.onTap != null) {
                hook.onTap();
              }
            },
            onFieldSubmitted: (t) {
              hook.onSubmitted(t);
            },
            textInputAction: hook.textInputAction == null
                ? TextInputAction.done
                : hook.textInputAction,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
  }
}
