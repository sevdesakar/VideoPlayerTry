import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_try_video/constants.dart';
import 'package:new_try_video/models/video.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {
  _compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(
      videoPath,
      quality: VideoQuality.MediumQuality,
    );
    return compressedVideo!.file;
  }

  Future<String> _uploadVideoToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('videos').child(id);

    UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot snap = await uploadTask;
   // final TaskSnapshot snap = await ref.putFile(_compressVideo(videoPath));

    String dowloadUrl = await snap.ref.getDownloadURL();
    return dowloadUrl;
  }

  // _getThumbnail(String videoPath) async {
  //   final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
  //   return thumbnail;
  // }

  // Future<String> _uploadImageToStorage(String id, String videoPath) async {
  //   Reference ref = firebaseStorage.ref().child('thumbnails').child(id);
  //   UploadTask uploadTask = ref.putFile(vş);
  //   TaskSnapshot snap = await uploadTask;
  //   String dowloadUrl = await snap.ref.getDownloadURL();
  //   return dowloadUrl;
  // }

  //upload video
  uploadVideo(
      String name, String caption, String videoPath) async {
    try {
      String licenceId = "1";
      // DocumentSnapshot userDoc = await firestore.collection('licences');
      
      var allDocs = await firestore.collection('videos').get();
      int len = allDocs.docs.length;
      String videoUrl = await _uploadVideoToStorage("Video $len", videoPath);
      //String thumbnail = await _uploadImageToStorage("Video $len", videoPath);

      Video video =Video(id: "Video $len", name: name, videoUrl: videoUrl, licenceId: licenceId, caption: caption);

    
      await firestore.collection('videos').doc('Video $len').set(
            video.toJson(),
          );
          Get.back();
    } catch (e) {
      Get.snackbar(
        'Error uploading Video',
        e.toString(),
      );
    }
  }
}
