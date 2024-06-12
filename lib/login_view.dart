import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:resp_adp_theme_239/theme_provider.dart';
import 'package:resp_adp_theme_239/ui_helper.dart';

class loginview extends StatelessWidget {
  MediaQueryData? mq;
  ThemeData? themeData;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context);
    themeData = Theme.of(context);
    isDark = themeData!.brightness==Brightness.dark;

    print("width: ${mq!.size.width}, height: ${mq!.size.height}");
    return Scaffold(
     /* backgroundColor: themeData!.brightness==Brightness.dark ? Colors.black : Colors.white,*/
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: mq!.orientation == Orientation.portrait
            ? portraitUI(context)
            : landscapeUI(context),
      ),
    );
  }

  Widget portraitUI(BuildContext context) {
    return mq!.size.height>610 ? portraitSubUI(context) : SingleChildScrollView(
      child: portraitSubUI(context),
    );
  }

  Widget portraitSubUI(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [


        SvgPicture.asset(
          "assets/images/login.svg",
          height: mq!.size.height*0.25,
         // width: mq!.size.height*0.4,
        ),

        SizedBox(
          height: 20,
        ),

        mainUI(context)

      ],
    );
  }
  
  Widget mainUI(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: mq!.size.width*0.45,
          height: 50,
          child: FittedBox(
            child: Text(
              "Hi, Welcome back..",
              style: mTextStyleHeadline(/*fontColor: isDark ? Colors.white : Colors.black*/)
            ),
          ),
        ),
        makeInput("Email"),
        makeInput("Password", obscureText: true),
        MaterialButton(
          onPressed: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context)=> loginview()));
          },
          minWidth: double.infinity,
          color: Colors.redAccent,
          height: 60,
          child: Text(
            "login",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Don't have an account?",
            style: mTextStyleBody(),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            "Sign Up",
            style: mTextStyleBody(),
          ),
        ]),
        SizedBox(
          height: 11,
        ),
        SwitchListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text("Dark Theme"),
            subtitle: Text("Change your App theme"),
            value: context.watch<ThemeProvider>().toggleTheme, onChanged: (value){
          context.read<ThemeProvider>().toggleTheme = value;
        })
      ],
    );
  }

  Widget landscapeUI(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: mq!.size.width>1100 ? 2 : 1,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/login.svg",
                  height: mq!.size.height*0.35,
                ),
                SizedBox(
                  height: 11,
                ),
                Text(
                  "Classico",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(child: mq!.size.height>440 ? mainUI(context) : SingleChildScrollView(
          child: mainUI(context),
        ))
      ],
    );
  }

  Widget makeInput(label, {obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        SizedBox(
          height: 3,
        ),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              )),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
