import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/colors.dart';

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
        title: const Text(
          "New Post",
          style: TextStyle(fontWeight: FontWeight.bold, color: kSecondaryColor),
        ),
      ),
    ));
  }
}
