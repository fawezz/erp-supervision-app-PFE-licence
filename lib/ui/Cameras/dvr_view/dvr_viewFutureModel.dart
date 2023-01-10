import 'dart:convert';
import 'dart:io';
import 'package:application_de_supervision/app/Constants.dart';
import 'package:http/http.dart' as http;
import 'package:application_de_supervision/models/dvrModel.dart';
import 'package:stacked/stacked.dart';



class DvrViewFutureModel extends FutureViewModel<List<dynamic>> {

  List<DVR> _dvrList;
  List<DVR> get dvrList => _dvrList;

  /*
  String url = "rtsp://admin:@192.168.0.100:5544/user=admin_password=tlJwpbo6_channel=2_stream=0.sdp";
  String urlTest = 'rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov';*/

  Future<List<void>> getDvrData() async {

    Uri getDvrUri = Uri.parse(fGetDvrAdress);
    http.Response res = await http.get(getDvrUri);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      //print(body.toString());
      _dvrList = body.map((dynamic item) => DVR.fromJson(item)).toList();
      notifyListeners();
      //print(dvrList.toString());
    } else {
      throw "cant get DVRs";
    }

  }

  @override
  Future<List<void>> futureToRun() => getDvrData();

}

