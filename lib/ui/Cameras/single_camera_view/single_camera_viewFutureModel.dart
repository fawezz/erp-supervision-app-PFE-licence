

import 'dart:async';
import 'dart:io';

import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:stacked/stacked.dart';
import 'package:get/get.dart';


class SingleCameraViewFutureModel extends FutureViewModel<List<dynamic>> {

  VlcPlayerController _videoPlayerController;

  VlcPlayerController get videoPlayerController => _videoPlayerController;

  set videoPlayerController(VlcPlayerController value) {
    notifyListeners();
    _videoPlayerController = value;
  }

  bool busyy = true;

  /*
  String url = "rtsp://admin:@192.168.0.100:5544/user=admin_password=tlJwpbo6_channel=2_stream=0.sdp";
  String urlTest = 'rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov';


                                   parameters: {"dvr":Get.arguments, "index": index.toString()} */


  Future<List<void>> initPlayer() async {
    if(_videoPlayerController == null) {
      //because future mo del calls this function twice and vlccontroller has to be not initialized
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      print(Get.arguments);
      String rtsp = Get.arguments["dvr"].rtsp;

      int selectedCamera = int.parse(Get.arguments["index"]) + 1;
      print(selectedCamera);

      String ch = rtsp.substring(0, rtsp.length - 14) + selectedCamera.toString() + rtsp.substring(rtsp.length - 13);
      _videoPlayerController = VlcPlayerController.network(
          ch,
          autoPlay: true,
          options: VlcPlayerOptions(), onInit: () {
        print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
        Timer(Duration(seconds: 5), (){
          busyy = false;
          notifyListeners();}
        );


        _videoPlayerController.play();
      },
      );




    }
  }

  @override
  Future<List<void>> futureToRun() => initPlayer();

}
