import 'dart:convert';

import 'package:application_de_supervision/app/Constants.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:application_de_supervision/app/httpService.dart';


class TauxOccupationViewFutureModel extends FutureViewModel<List<dynamic>> {



  /////////////////////////////////////////////Variable Afficher///////////////////////////////////////////
//{"typeArticle":"2","familleArticle":"8"}
  int _occupeComposant;
  int get occupeComposant=> _occupeComposant;

  int _occupeAccessoire;
  int get occupeAccessoire => _occupeAccessoire;

  int _capaciteTissu=369800;

  int _capaciteFourniture=7765416;

  /////////////////////////////////////////////Action Afficher///////////////////////////////////////////

  Future<List<void>> postData() async {

    Get.context.showLoaderOverlay();
    var parameters = jsonEncode( {
      "typeArticle" : "1",
      "familleArticle" : "9",
    });

    print(parameters);

    Uri postDataUri = Uri.parse(fPostTauxOccupationAdress);

    http.Response response = await http.post(postDataUri, body: parameters, headers: {"Content-type": "application/json", "Connection":"keep-alive",
      "Accept": "application/json"});
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      _capaciteTissu = body["quantiteTotale"];
      print(_capaciteTissu);
      print("type of bodyy " + body.runtimeType.toString());
      Get.context.hideLoaderOverlay();
    } else {
      Get.context.hideLoaderOverlay();
      print("erreuuur");
      throw "cant get sites";
    }
  }


  @override
  Future<List<void>> futureToRun() => postData();

}

