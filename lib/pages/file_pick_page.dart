import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:instagram_clone/constant/colors.dart';
import 'package:instagram_clone/constant/dimensions.dart';
import 'package:instagram_clone/pages/add_new_post_page.dart';
import 'package:instagram_clone/utils/extension.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

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
                GestureDetector(
                  onTap: () {
                    context.navigateBack();
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: kFontSize18x),
                  ),
                ),
                Text(
                  "Select Album",
                  style: TextStyle(
                      fontSize: kFontSize20x, fontWeight: FontWeight.w500),
                ),
                Gap(kSP50x)
              ],
            ),
            Gap(kSP40x),
            Row(
              children: [
                IconsItemView(
                    icon: Icons.video_library_rounded, iconCaption: "Recents"),
                Gap(kSP20x),
                GestureDetector(
                  onTap: () => PersistentNavBarNavigator.pushNewScreen(context,
                      screen: AddNewPostPage(), withNavBar: false),
                  child: IconsItemView(
                      icon: CupertinoIcons.photo, iconCaption: "Photos"),
                ),
                Gap(kSP20x),
                GestureDetector(
                  onTap: () => PersistentNavBarNavigator.pushNewScreen(context,
                      screen: AddNewPostPage(), withNavBar: false),
                  child: IconsItemView(
                      icon: Icons.play_circle_outline, iconCaption: "Videos"),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class IconsItemView extends StatelessWidget {
  const IconsItemView(
      {super.key, required this.icon, required this.iconCaption});

  final IconData icon;
  final String iconCaption;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: kFilePickerIconLength,
          height: kFilePickerIconLength,
          decoration: BoxDecoration(
              color: kFilePickerIconColor,
              borderRadius: BorderRadius.circular(kSP30x)),
          child: Icon(
            icon,
            color: kSecondaryColor,
          ),
        ),
        Gap(kSP10x),
        Text(iconCaption)
      ],
    );
  }
}
