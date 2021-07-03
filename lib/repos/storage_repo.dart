import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class StorageRepo {
  static final firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;

  static Future<String> saveFile(String filePath, String folderName) async {
    // get the file name
    final String fileName = 
      filePath.substring(filePath.lastIndexOf('/') + 1);
    
    // create an UploadTask
    final firebase_storage.UploadTask uploadTask = 
      storage.ref('$folderName/$fileName').putFile(File(filePath));
    
    // upload the file
    final firebase_storage.TaskSnapshot taskSnapshot = 
      await uploadTask.whenComplete(() {});

    // return the file URL
    return taskSnapshot.ref.getDownloadURL();
  }

  static Future<void> deleteFile(String url) async {
    await storage.refFromURL(url).delete();
  }
}
