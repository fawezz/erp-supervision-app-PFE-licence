import 'dart:convert';

import 'package:application_de_supervision/app/Constants.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;



class AgeStockViewFutureModel extends FutureViewModel<List<dynamic>> {


  List<bool> _isSelected = [true, false];

  List<bool> get isSelected => _isSelected;

  List<bool> updateIsSelected(int index) {
    _isSelected = [false,false];
    _isSelected[index] = true;
    notifyListeners();
    return _isSelected;
  }


  /////////////////////////////////////////////Variable Afficher///////////////////////////////////////////

  List<dynamic> _ageDataComposant;
  List<dynamic> get ageDataComposant => _ageDataComposant;

  List<dynamic> _ageDataAccessoire;
  List<dynamic> get ageDataAccessoire => _ageDataAccessoire;

  double _occupeComposant;
  double get occupeComposant=> _occupeComposant;

  double _occupeAccessoire;
  double get occupeAccessoire => _occupeAccessoire;

  /////////////////////////////////////////////Action Afficher///////////////////////////////////////////


  void postDataComposant() async {

    var parameters = jsonEncode(
      ["2", "8"])
    ;
    //var parameters = ["2", "8"];
    Uri postDataUri = Uri.parse(fPostAgeStockAdress);

    http.Response response = await http.post(postDataUri, body: parameters, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    print(response);
    if (response.statusCode == 200) {
      print(response.statusCode);
      _ageDataComposant = jsonDecode(response.body);
      notifyListeners();
      /*print(body);
      print(body[0]["interval"]);
      print(body[0]["pourcentage"]);*/

      /*_occupeComposant = body["NonPlanifie"]["sommeQteOf"].toDouble();
      _occupeAccessoire = body["enCours"]["sommeQteOf"].toDouble();*/
    } else {
      print("Error posting data Composant");
      throw "cant post data";
    }

  }
  void postDataAccessoire() async {
    var parameters = jsonEncode(
        ["1", "9"])
    ;
    //var parameters = ["2", "8"];
    Uri postDataUri = Uri.parse(
        fPostAgeStockAdress);

    http.Response response = await http.post(
        postDataUri, body: parameters, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    print(response);
    if (response.statusCode == 200) {
      print(response.statusCode);
      _ageDataAccessoire = jsonDecode(response.body);
      notifyListeners();
    } else {
      print("Error posting data Accessoire");
      throw "cant post data Composant";
    }
  }
  Future<List<void>> postData() async {
      postDataComposant();
      postDataAccessoire();
    }

  @override
  Future<List<void>> futureToRun() => postData();

}

