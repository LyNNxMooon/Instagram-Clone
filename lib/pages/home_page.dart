import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/colors.dart';
import 'package:instagram_clone/constant/dimensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Text(
          "Instagram",
          style: TextStyle(
              fontFamily: 'Cookie',
              color: kSecondaryColor,
              fontSize: 35,
              fontWeight: FontWeight.w500),
        ),
        actions: [
          Icon(
            CupertinoIcons.suit_heart,
            color: kSecondaryColor,
            size: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: kSP20x, left: kSP25x),
            child: Icon(
              Icons.send_sharp,
              color: kSecondaryColor,
              size: 30,
            ),
          )
        ],
      ),
    ));
  }
}
