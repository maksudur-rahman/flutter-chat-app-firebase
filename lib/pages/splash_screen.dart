import 'dart:async';
import 'package:chat_application_flutter/pages/home_page.dart';
import 'package:chat_application_flutter/providers/auth_provider.dart';
import 'package:chat_application_flutter/utils/color_utils.dart';
import 'package:chat_application_flutter/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double? _height;
  double? _width;
  //final bool _isLoggedIn = (sharedPrefs.token == null) ? false : true;
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      checkSignedIn();
    });
  }

  void checkSignedIn() async {
    AuthProvider authProvider = context.read<AuthProvider>();
    bool isGmailLoggedIn = await authProvider.isGmailLoggedIn();
    bool isFacebookLoggedIn = await authProvider.isFacebookLoggedIn();
    if (isGmailLoggedIn || isFacebookLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: ColorUtils.SPLASH_BACKGROUND,
        height: _height,
        width: _width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: _height! * .20,
              width: _width! * .20,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
              ),
              alignment: Alignment.center,
              child: SizedBox(
                height: _height! * .18,
                width: _width! * .18,
                child: Image.asset(
                  "assets/images/icon.png",
                ),
              ),

            )
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }
}
