import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/colors.dart';
import 'package:instagram_clone/constant/dimensions.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget(
      {super.key,
      required this.content,
      this.isSuccessDialog = true,
      required this.onTapOK});

  final String content;
  final bool isSuccessDialog;
  final Function onTapOK;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: isSuccessDialog
          ? const Icon(
              Icons.check_circle,
              color: kSecondaryColor,
              size: kSP40x,
            )
          : const Icon(
              Icons.error,
              color: kErrorAndDeleteColor,
              size: kSP40x,
            ),
      content: Text(
        content,
        textAlign: TextAlign.center,
      ),
      actions: [
        MaterialButton(
          onPressed: () {
            onTapOK();
          },
          child: const Text("OK"),
        )
      ],
    );
  }
}
