import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:new_try_video/constants.dart';
import 'package:new_try_video/models/video.dart';
class VideoController extends GetxController{
  final Rx<List<Video>> _videoList = Rx<List<Video>>([]);
  List<Video> get videoList => _videoList.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _videoList.bindStream(firestore.collection('videos').snapshots().map((QuerySnapshot query){
      List<Video> retVal = [];
      for(var element in query.docs)
      {
        retVal.add(Video.fromSnap(element));
      }
      return retVal;
    }));
  }
}