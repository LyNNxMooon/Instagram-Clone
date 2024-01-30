import 'dart:io';

import 'package:instagram_clone/bloc/base_bloc.dart';
import 'package:instagram_clone/data/model/instagram_clone_model.dart';
import 'package:instagram_clone/data/vos/feed_vo.dart';
import 'package:instagram_clone/utils/enums.dart';
import 'package:instagram_clone/utils/file_upload_to_firebase_storage.dart';

class AddPostBloc extends BaseBloc {
  FileType _fileType = FileType.photo;
  File? _selectedFile;

  FileType get getFiletype => _fileType;
  File? get getSelectedFile => _selectedFile;

  set setFileType(FileType fileType) {
    _fileType = fileType;
    notifyListeners();
  }

  set setSelectedFile(File? file) {
    _selectedFile = file;
    notifyListeners();
  }

  final InstagramCloneModel _instagramCloneModel = InstagramCloneModel();

  Future saveFeed(String caption) async {
    if (caption.isEmpty) {
      return Future.error("Please write what is in your mind");
    }

    int id = DateTime.now().millisecondsSinceEpoch;

    String fileURL = await _uploadFileToFirebaseStorage();

    final FeedVO feed = FeedVO(
        id: id,
        caption: caption,
        fileURL: fileURL,
        fileType: _fileType.name,
        createdAt: DateTime.now().toString());

    return _instagramCloneModel.saveFeed(feed);
  }

  Future _uploadFileToFirebaseStorage() {
    String path = '';
    String contentType = '';

    if (_fileType == FileType.photo) {
      path = 'image';
      contentType = 'image/jpg';
    } else {
      path = 'video';
      contentType = 'video/mp4';
    }

    if (_selectedFile == null) {
      return Future.error('Please select a file');
    }

    return FileUploadToFireBaseStorageUtils.uploadToFirebaseStorage(
        _selectedFile!, path, contentType);
  }
}
