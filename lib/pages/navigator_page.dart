import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/colors.dart';

import 'package:instagram_clone/pages/add_new_post_page.dart';
import 'package:instagram_clone/pages/home_page.dart';
import 'package:instagram_clone/pages/profile_page.dart';
import 'package:instagram_clone/pages/reels_page.dart';
import 'package:instagram_clone/pages/search_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  List<Widget> buildScreens() {
    return [
      const HomePage(),
      const SearchPage(),
      const AddNewPostPage(),
      const ReelsPage(),
      const ProfilePage()
    ];
  }

  List<PersistentBottomNavBarItem> navBarItems() {
    return [
      PersistentBottomNavBarItem(
          iconSize: 30,
          icon: const Icon(
            Icons.home_filled,
            color: kSecondaryColor,
          ),
          inactiveIcon: const Icon(
            Icons.home_outlined,
            color: kSecondaryColor,
          )),
      PersistentBottomNavBarItem(
          iconSize: 30,
          icon: const Icon(
            Icons.search,
            color: kSecondaryColor,
          )),
      PersistentBottomNavBarItem(
        iconSize: 30,
        icon: const Icon(Icons.add_box_outlined, color: kSecondaryColor),
      ),
      PersistentBottomNavBarItem(
        iconSize: 30,
        icon: const Icon(Icons.movie_creation_outlined, color: kSecondaryColor),
      ),
      PersistentBottomNavBarItem(
        iconSize: 30,
        icon: const Icon(Icons.person, color: kSecondaryColor),
      ),
    ];
  }

  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: buildScreens(),
      items: navBarItems(),
      confineInSafeArea: true,
      backgroundColor: kPrimaryColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style11,
      //hideNavigationBar: true,
    );
  }
}
