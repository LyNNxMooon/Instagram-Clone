// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import 'package:instagram_clone/bloc/add_post_bloc.dart';
import 'package:instagram_clone/constant/colors.dart';
import 'package:instagram_clone/constant/dimensions.dart';
import 'package:instagram_clone/utils/enums.dart';
import 'package:instagram_clone/utils/extension.dart';
import 'package:instagram_clone/widgets/caption_text_field_widget.dart';
import 'package:instagram_clone/widgets/dialog_widget.dart';
import 'package:instagram_clone/widgets/loading_widget.dart';
import 'package:instagram_clone/widgets/video_player_widget.dart';
import 'package:provider/provider.dart';

final _captionController = TextEditingController();

class AddNewPostPage extends StatelessWidget {
  AddNewPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddPostBloc>(
      create: (context) => AddPostBloc(),
      child: SafeArea(
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
            style:
                TextStyle(fontWeight: FontWeight.bold, color: kSecondaryColor),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSP15x),
          child: Column(
            children: [
              Gap(kSP10x),
              Center(
                child: Selector<AddPostBloc, FileType>(
                  builder: (_, fileType, __) =>
                      FileTypeView(fileType: fileType),
                  selector: (_, bloc) => bloc.getFiletype,
                ),
              ),
              Gap(kSP15x),
              CaptionTextFieldWidget(controller: _captionController),
              Gap(kSP30x),
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
                  IntegrationWithFaceBookOptionView(),
                  Gap(kSP10x),
                  Row(
                    children: [
                      Text(
                        "Sharing as ",
                        style: TextStyle(color: kGreyColor),
                      ),
                      Text(
                        "Kyaw Lynn Thant ",
                        style: TextStyle(
                            color: kTabBarColor, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Audience is  ",
                        style: TextStyle(color: kGreyColor),
                      ),
                      Text(
                        "Public ",
                        style: TextStyle(
                            color: kTabBarColor, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Gap(kSP10x),
                  OptionTileView(
                      icon: Icons.settings,
                      title: "Advanced settings",
                      subTitle: ''),
                  Gap(kSP65x),
                  UploadButtonView()
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}

class FileTypeView extends StatelessWidget {
  const FileTypeView({super.key, required this.fileType});

  final FileType fileType;

  @override
  Widget build(BuildContext context) {
    return Selector<AddPostBloc, File?>(
      builder: (_, file, __) => Container(
        width: kPhotoAndVideoViewerLength,
        height: kPhotoAndVideoViewerLength,
        child: file != null && fileType == FileType.photo
            ? PhotoView(filePath: file.path)
            : file != null && fileType == FileType.video
                ? VideoPlayerWidget(
                    filePath: file.path,
                  )
                : const SizedBox(),
      ),
      selector: (_, bloc) => bloc.getSelectedFile,
    );
  }
}

class PhotoView extends StatelessWidget {
  const PhotoView({
    super.key,
    required this.filePath,
  });

  final String filePath;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.file(
        File(filePath),
        fit: BoxFit.cover,
      ),
    );
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
              size: 31,
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

class IntegrationWithFaceBookOptionView extends StatelessWidget {
  IntegrationWithFaceBookOptionView({super.key});

  bool isToggle = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.facebook_outlined,
              color: kSecondaryColor,
              size: 31,
            ),
            Gap(kSP15x),
            Text(
              "Share To Facebook",
              style: TextStyle(fontSize: kFontSize17x),
            )
          ],
        ),
        FlutterSwitch(
          inactiveColor: kGreyColor,
          activeColor: kBlueColor,
          width: 50,
          height: 20.0,
          toggleSize: 45.0,
          value: isToggle,
          borderRadius: 30.0,
          showOnOff: true,
          onToggle: (_) {
            isToggle = !isToggle;
          },
        )
      ],
    );
  }
}

class UploadButtonView extends StatelessWidget {
  const UploadButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final bloc = context.read<AddPostBloc>();
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const LoadingWidget());
        bloc.saveFeed(_captionController.text).then((value) {
          context.navigateBack();
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => DialogWidget(
                    content: 'Success',
                    onTapOK: () {
                      context.navigateBack();
                    },
                  ));
        }).catchError((error) {
          context.navigateBack();
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => DialogWidget(
                    content: error.toString(),
                    isSuccessDialog: false,
                    onTapOK: () {
                      context.navigateBack();
                    },
                  ));
        });
        _captionController.clear();
      },
      child: Container(
        width: double.infinity,
        height: kButtonHeight,
        decoration: BoxDecoration(
            color: kBlueColor, borderRadius: BorderRadius.circular(kSP10x)),
        child: Center(
            child: Text(
          "Share",
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
