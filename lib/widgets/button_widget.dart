import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/colors.dart';
import 'package:instagram_clone/constant/dimensions.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.functionName,
      required this.function,
      required this.caption});

  final String functionName;
  final Function? function;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function,
      child: Container(
        width: double.infinity,
        height: kButtonHeight,
        decoration: BoxDecoration(
            color: kBlueColor, borderRadius: BorderRadius.circular(kSP10x)),
        child: Center(
            child: Text(
          functionName,
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
