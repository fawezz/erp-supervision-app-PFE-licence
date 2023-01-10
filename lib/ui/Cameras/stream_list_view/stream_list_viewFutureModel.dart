import 'dart:io';

import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:stacked/stacked.dart';
import 'package:get/get.dart';


class StreamListViewFutureModel extends FutureViewModel<List<dynamic>> {

  List<VlcPlayerController> _videoPlayerControllers = [];

  List<VlcPlayerController> get videoPlayerControllers =>
      _videoPlayerControllers;

  List<String> _rtspList = [];

  bool _isBusy = true;
  bool get isBusy => _isBusy;



  void makeAdress(){

    String rtsp = Get.arguments["dvr"].rtsp;
    for(int j = 1; j<=Get.arguments["dvr"].nbrCamera; j++)
      {
        print("inside boucle");

        print(rtsp.substring(0,rtsp.length-14) + '$j' +rtsp.substring(rtsp.length-13));
        String ch = rtsp.substring(0,rtsp.length-14) + '$j' +rtsp.substring(rtsp.length-13);

        _rtspList.add(ch);
        print(ch + "         **");
      }
    print("finished make adress");
  }

  /*
  String url = "rtsp://admin:@192.168.0.100:5544/user=admin_password=tlJwpbo6_channel=2_stream=0.sdp";
  String urlTest = 'rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov';*/


  Future<List<void>> initPlayer() async {

    print("made adresses");
    print(Get.arguments["dvr"].nbrCamera);
    makeAdress();
    for(int i=0; i<Get.arguments["dvr"].nbrCamera; i++) {
      print("controller $i");
      _videoPlayerControllers.add(
          VlcPlayerController.network(_rtspList[i],
          hwAcc: HwAcc.AUTO,
          autoPlay: true,
          options: VlcPlayerOptions(),
          onInit: () {
            _videoPlayerControllers[i].play();
          })
      );
      notifyListeners();
      print("camera " + i.toString());
    }
    _isBusy = false;
  }
  /*Future<List<void>> postData() async {
    makeAdress();
    initPlayer();

  }*/

  @override
  Future<List<void>> futureToRun() => initPlayer();

}






/*
class CameraViewFutureModel extends FutureViewModel<List<dynamic>> {

  VlcPlayerController _videoPlayerController1 = null;
  VlcPlayerController get videoPlayerController1 => _videoPlayerController1;

  VlcPlayerController _videoPlayerController2 = null;
  VlcPlayerController get videoPlayerController2 => _videoPlayerController2;

  VlcPlayerController _videoPlayerController3 = null;
  VlcPlayerController get videoPlayerController3 => _videoPlayerController3;

  Future<void> initializePlayer() async {}

  void dispose() async {
    super.dispose();
    await _videoPlayerController1.stopRendererScanning();
    await _videoPlayerController1.dispose();
  }

  String urlFinal1 = "rtsp://admin:@102.159.68.195:81/user=admin_password=tlJwpbo6_channel=1_stream=0.sdp";
  String urlFinal2 = "rtsp://admin:@102.159.68.195:81/user=admin_password=tlJwpbo6_channel=2_stream=0.sdp";
  String urlFinal3 = "rtsp://admin:@102.159.68.195:81/user=admin_password=tlJwpbo6_channel=3_stream=0.sdp";
bool _waiting1 = true, _waiting2 = true, _waiting3 = true;

  get waiting2 => _waiting2;

  get waiting3 => _waiting3;
  get waiting1 => _waiting1;


  /*
  String url = "rtsp://admin:@192.168.0.100:5544/user=admin_password=tlJwpbo6_channel=2_stream=0.sdp";
  String urlTest = 'rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov';*/
  Future<String> initPlayer() async {
    print("GOT INNNN");
    _videoPlayerController1 = VlcPlayerController.network( urlFinal1,
        autoPlay: true,
        options: VlcPlayerOptions(),
        onInit: (){
           _waiting1=false;
           notifyListeners();

           _videoPlayerController1.play();
        }
    );
    print("camera 1111111111111111111111111");
    sleep(Duration(seconds:1));

    _videoPlayerController2 = VlcPlayerController.network( urlFinal2,
        autoPlay: true,
        options: VlcPlayerOptions(),
        onInit: (){
          _waiting2=false;
          notifyListeners();

          _videoPlayerController2.play();
        }
    );
    print("camera 22222222222222222222222222");
    sleep(Duration(seconds:1));
    
    _videoPlayerController3 = VlcPlayerController.network( urlFinal3,
        autoPlay: true,
        options: VlcPlayerOptions(),
        onInit: (){
          _waiting3=false;
          notifyListeners();
          _videoPlayerController3.play();
        }
    );
    print("camera 33333333333333333333333333");
    //print(_videoPlayerController.toString());
    return null;
  }
  Future<List<void>> postData() async {
  initPlayer();

  }

  @override
  Future<List<void>> futureToRun() => postData();

}
*/
