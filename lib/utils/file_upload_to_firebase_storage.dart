import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FileUploadToFireBaseStorageUtils {
  static final _firebaseStorage = FirebaseStorage.instance;

  static Future<String> uploadToFirebaseStorage(
      File file, String path, String contentType) {
    var metaData = SettableMetadata(contentType: contentType);
    return _firebaseStorage
        .ref(path)
        .child(DateTime.now().millisecondsSinceEpoch.toString())
        .putFile(file, metaData)
        .then((snapShot) {
      return snapShot.ref.getDownloadURL().then((value) => value);
    });
  }
}
