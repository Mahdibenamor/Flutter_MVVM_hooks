import 'package:flutter/material.dart';
import 'package:flutter_app/utils/Utils.dart';
import 'package:flutter_app/views/BasePage.dart';
import 'package:flutter_app/shared/UIComponents/ColorCell.dart';
import 'package:flutter_app/shared/UIComponents/CustomLinkButton.dart';
import 'package:flutter_app/utils/Constants.dart';
import 'package:flutter_app/utils/AppSettings.dart';
import 'package:provider/provider.dart';


class SettingsViewPage extends BasePage {
  //
  SettingsViewPage();

  @override
  void initState() {
  }
  @override
  Widget build(BuildContext context) {
    initState();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: context.watch<AppSettings>().appColor,
          title: Text("Settings"),
        ),
        body: Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
              Wrap(
                children:
                    List<Widget>.generate(Constants.colors.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      context.read<AppSettings>().updateColor(index);
                      Utils.saveThemeIndex(index);
                    },
                    child: ColorCell(color: Constants.colors[index]),
                  );
                }),
              ),
              CustomLinkButton(
                text: "LogOut",
                onPressed: () async {
                  BindingContext.NavigateLoginPage(context);
                  context.read<AppSettings>().updateColor(0);
                },
              )
            ])));
  }
}
