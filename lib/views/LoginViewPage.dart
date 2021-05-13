import 'package:flutter/material.dart';
import 'package:flutter_app/shared/UIComponents/CustomTextFeild.dart';
import 'package:flutter_app/shared/UIComponents/CustomButton.dart';
import 'package:flutter_app/shared/UIComponents/CustomLinkButton.dart';
import 'package:flutter_app/shared/AppBar/SearchAppBar.dart';
import 'package:flutter_app/utils/AppSettings.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/utils/Utils.dart';
import 'package:flutter_app/views/BasePage.dart';

class LoginViewPage extends BasePage {

  LoginViewPage();

  void initState() {
  }

  @override
  Widget build(BuildContext context) {

    final AppBarTextField = useCustomTextFeild(
        width: MediaQuery.of(context).size.width * 0.875,
        height: 40,
        inputType: TextInputType.text,
        hintText: "Search...",
        isPassword: false,
        prefixIcon: Icons.search,
        maxLines: 1,
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
        )
    );

    final EmailTextField = useCustomTextFeild(
        width: MediaQuery.of(context).size.width * 0.875,
        height: 48.0,
        inputType: TextInputType.text,
        hintText: "Email",
        isPassword: false,
        prefixIcon: Icons.email,
        maxLines: 1,
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
        )
    );

    final PasswordTextField = useCustomTextFeild(
        width: MediaQuery.of(context).size.width * 0.875,
        height: 48.0,
        inputType: TextInputType.text,
        hintText: "Password",
        prefixIcon: Icons.lock,
        isPassword: true,
        maxLines: 1,
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
        )
    );

    final appBar = useSearchAppBar(
        Text("Login"),
        Icon(Icons.search),
        AppBarTextField,
        Icon(Icons.close));


    final LoginButton = useCustomButton(
      onPressed: () {
        BindingContext.NavigateToHomePage(context);
        Utils.saveLoggedIn(true);
      },
      text: "Get It Started",
      borderColor:  Colors.grey,
      textColor: context.watch<AppSettings>().appColor,
      iconColor: context.watch<AppSettings>().appColor,
    );
    this.initState();
    return Scaffold(
      resizeToAvoidBottomInset: false,   //new line
      appBar: appBar,
      body: Container(
        child: Column(
          children: <Widget>[
            EmailTextField,
            PasswordTextField,
            Row(
              children: [
                Expanded(
                  child: LoginButton,
                )
              ],
            ),
            CustomLinkButton(
              text: "Forgot Password?",
              color: Colors.black,
              onPressed: () {
                //TODO implement the inpressed in login page
              },
            )
          ],
        ),
      ),
    );
  }
}
