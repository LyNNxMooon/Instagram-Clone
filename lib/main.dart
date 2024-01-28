import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'package:instagram_clone/constant/colors.dart';
import 'package:instagram_clone/constant/dimensions.dart';
import 'package:instagram_clone/firebase_options.dart';

import 'package:instagram_clone/pages/navigator_page.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          centered: true,
          duration: 2500,
          splashIconSize: double.infinity,
          splash: SplashScreenPage(),
          nextScreen: const NavigatorPage(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: kPrimaryColor),
    );
  }
}

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: kSP30x),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(),
            SizedBox(
              width: kSplashIconLength,
              height: kSplashIconLength,
              child: Image.asset("assets/images/instagram.png"),
            ),
            Column(
              children: [
                Text(
                  'from',
                  style: TextStyle(color: kGreyColor, fontSize: kFontSize18x),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradientText('∞',
                        style: TextStyle(
                            fontSize: kFontSize40x,
                            fontWeight: FontWeight.w500),
                        colors: [
                          Color(0xfff9ce34),
                          Color(0xffee2a7b),
                          Color(0xff6228d7)
                        ]),
                    GradientText(' Meta',
                        style: TextStyle(
                            fontSize: kFontSize22x,
                            fontWeight: FontWeight.w500),
                        colors: [
                          Color(0xfff9ce34),
                          Color(0xffee2a7b),
                          Color(0xff6228d7)
                        ]),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
