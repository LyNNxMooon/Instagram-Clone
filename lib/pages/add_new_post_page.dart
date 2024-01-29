import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:instagram_clone/constant/colors.dart';
import 'package:instagram_clone/constant/dimensions.dart';
import 'package:instagram_clone/utils/extension.dart';

class AddNewPostPage extends StatelessWidget {
  const AddNewPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        leading: GestureDetector(
          onTap: () => context.navigateBack(),
          child: Icon(
            Icons.arrow_back,
            color: kSecondaryColor,
          ),
        ),
        title: const Text(
          "New Post",
          style: TextStyle(fontWeight: FontWeight.bold, color: kSecondaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSP15x),
        child: Column(
          children: [
            Gap(kSP15x),
            Center(
              child: Container(
                width: kPhotoAndVideoViewerLength,
                height: kPhotoAndVideoViewerLength,
                color: kSecondaryColor,
              ),
            ),
            Gap(kSP20x),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Write a caption or add a poll...',
                  hintStyle: TextStyle(color: kGreyColor),
                  enabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none)),
            ),
            Gap(kSP35x),
            Divider(thickness: 1),
            Column(
              children: [
                OptionTileView(
                    icon: Icons.location_on_outlined,
                    title: "Add Location",
                    subTitle: ''),
                Gap(kSP20x),
                OptionTileView(
                    icon: CupertinoIcons.person,
                    title: "Tag People",
                    subTitle: ''),
                Gap(kSP20x),
                OptionTileView(
                    icon: CupertinoIcons.eye,
                    title: "Audience",
                    subTitle: 'Everyone'),
                Gap(kSP20x),
                OptionTileView(
                    icon: Icons.settings,
                    title: "Advanced settings",
                    subTitle: ''),
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class OptionTileView extends StatelessWidget {
  const OptionTileView(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle});

  final IconData icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: kSecondaryColor,
              size: 32,
            ),
            Gap(kSP15x),
            Text(
              title,
              style: TextStyle(fontSize: kFontSize17x),
            )
          ],
        ),
        Row(
          children: [
            Text(
              subTitle,
              style: TextStyle(
                color: kGreyColor,
              ),
            ),
            Gap(kSP15x),
            Icon(
              Icons.arrow_forward_ios,
              color: kGreyColor,
              size: 19,
            )
          ],
        )
      ],
    );
  }
}
