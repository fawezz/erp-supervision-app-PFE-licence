import 'dart:convert';
import 'dart:math';

import 'package:application_de_supervision/app/Constants.dart';
import 'package:application_de_supervision/models/variationMauvaisPilotage.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

import 'package:application_de_supervision/app/httpService.dart';


class VariationPilotageViewFutureModel extends FutureViewModel {


  List<bool> _isSelected = [true, false];

  List<bool> get isSelected => _isSelected;

  List<bool> updateIsSelected(int index) {
    _isSelected = [false,false];
    _isSelected[index] = true;
    notifyListeners();
    return _isSelected;
  }

  List<int> integerList = [5,8,6,7,2,1,3,5];


  List<DummyData> dummyDataSemaine = [DummyData("lundi",45),DummyData("mardi",60),DummyData("mercredi",70),DummyData("jeudi",50)];
  List<DummyData> dummyDataMois = [DummyData("jan",150),DummyData("fev",180),DummyData("mars",170),
    DummyData("avr",190), DummyData("mai",145), DummyData("juin", 165)];




  double _sommeMauvaisPilotage;
  double get sommeMauvaisPilotage=> _sommeMauvaisPilotage;

  double _sommeEnCours;
  double get sommeEnCours => _sommeEnCours;

  /////////////////////////////////////////////Action Afficher///////////////////////////////////////////

  Future<void> postData() async {

    //print(dummyDataMois.elementAt(0)["mauvaisPilotage"].toString());
    DateTime today = DateTime.now();
    DateTime dateDebut = today.subtract(Duration(days: today.weekday - 1));
    print("date debut : " + dateDebut.toString());
    dateDebut = dateDebut.subtract(Duration(days: 28));
    print(today.toString() + " aaaand " + dateDebut.toString());

    String stringDateDebut = "" + dateDebut.year.toString() + "-" +
        dateDebut.month.toString() + "-" + dateDebut.day.toString();
    String stringDateFin = "" + today.year.toString() + "-" +
        today.month.toString() + "-" + today.day.toString();
    var parametersSemaine = jsonEncode(
      {
        "partieInterresId": "37",
        "idSite": null,
        "dateDe": stringDateDebut,
        "dateA": stringDateFin,
        "critereSpeciale": "VARIATION",
        "critereSpecialeSM": "MOIS",
      });

    Uri postDataUri = Uri.parse(fPostVariationMauvaisPilotage);

    http.Response responseSemaine = await http.post(
        postDataUri, body: parametersSemaine,
        headers: {
          "Content-type": "application/json",
          "Connection": "keep-alive",
          "Accept": "application/json"
        });
    if (responseSemaine.statusCode == 200) {
      var body1 = jsonDecode(responseSemaine.body);
      print("semaine's body is : " + body1.toString());


      ///// second post
      var parametersMois = jsonEncode(
          {
            "partieInterresId": "37",
            "idSite": null,
            "dateDe": stringDateDebut,
            "dateA": stringDateFin,
            "critereSpeciale": "VARIATION",
            "critereSpecialeSM": "MOIS",
          });
      http.Response responseMois = await http.post(
          postDataUri, body: parametersMois,
          headers: {
            "Content-type": "application/json",
            "Connection": "keep-alive",
            "Accept": "application/json"
          });
      if (responseMois.statusCode == 200) {
        var body2 = jsonDecode(responseMois.body);
        print("month's body is : " + body2.toString());

        //print(body["NonPlanifie"]["sommeQteOf"]);
/*
      _sommeMauvaisPilotage = body["NonPlanifie"]["sommeQteOf"].toDouble();
      _sommeEnCours = body["enCours"]["sommeQteOf"].toDouble();
      notifyListeners();*/


      } else {
        throw "cant get sites";
      }
    }
  }
  @override
  Future futureToRun() {
    postData();
  }

}

class DummyData {
  final String labell;
  final int mauvaisPilotage;

  DummyData(this.labell, this.mauvaisPilotage);
}