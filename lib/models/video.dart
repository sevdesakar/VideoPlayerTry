import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  String id;
  String name;
  String videoUrl;
  //String thumbnail;
  String caption;
  String licenceId;

  Video({
    required this.id,
    required this.name,
    required this.videoUrl,
   // required this.thumbnail,
    required this.caption,
    required this.licenceId,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "videoUrl": videoUrl,
       // "thumbnail": thumbnail,
        "caption": caption,
        "licenceId": licenceId,
      };
  static Video fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Video(
      id: snapshot['id'],
      name: snapshot['name'],
      videoUrl: snapshot['videoUrl'],
      //thumbnail: snapshot['thumbnail'],
      caption: snapshot['caption'],
      licenceId: snapshot['licenceId'],
    );
  }
}
