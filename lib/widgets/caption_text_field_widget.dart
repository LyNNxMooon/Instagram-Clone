import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/colors.dart';

class CaptionTextFieldWidget extends StatelessWidget {
  const CaptionTextFieldWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: 'Write a caption or add a poll...',
          hintStyle: TextStyle(color: kGreyColor),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none)),
    );
  }
}
