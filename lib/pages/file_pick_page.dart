import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:instagram_clone/constant/colors.dart';
import 'package:instagram_clone/constant/dimensions.dart';

class FilePickPage extends StatelessWidget {
  const FilePickPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(kSP20x),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: kFilePickPageBarWidth,
              height: kFilePickPageBarHeight,
              decoration: BoxDecoration(
                  color: kTabBarColor, borderRadius: BorderRadius.circular(2)),
            ),
            Gap(kSP30x),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cancel",
                  style: TextStyle(fontSize: kFontSize18x),
                ),
                Text(
                  "Select Album",
                  style: TextStyle(
                      fontSize: kFontSize20x, fontWeight: FontWeight.w500),
                ),
                Gap(kSP50x)
              ],
            )
          ],
        ),
      ),
    ));
  }
}
