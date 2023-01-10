import 'dart:convert';

import 'package:application_de_supervision/app/Constants.dart';
import 'package:application_de_supervision/app/httpService.dart';
import 'package:application_de_supervision/app/sharedPrefsService.dart';
import 'package:application_de_supervision/app/stompService.dart';
import 'package:application_de_supervision/models/userModel.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';


class LoginViewModel extends BaseViewModel {

  String _userName;
  String get userName => _userName;
  String _password;
  String get password => _password;

  void setUserName(String value) {
    _userName = value;
  }
  void setPassword(String value) {
    _password = value;
  }


  Future<bool> postLogin() async {
    var parameters = jsonEncode({
      "userName": _userName,
      "password": _password,
    });

    Uri postDataUri = Uri.parse(fPostLoginAdress);
    http.Response response = await http.post(
        postDataUri, body: parameters, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });


    if (response.statusCode == 200) {
      var user = jsonDecode(response.body);
      ////
      /*print(response.statusCode);
      print(user.toString());
      print(user.runtimeType);*/
      ////
      if(user["userName"] != null)
        {
          User u = User.fromJson(user);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          SharedPrefsSerivce.currentUserId = u.id;
          SharedPrefsSerivce.currentUserFirstName = u.firstName;
          SharedPrefsSerivce.currentUserRole = u.roleNames;
          prefs.setString("firstName", u.firstName);
          //prefs.setString("lastName", u.lastName);
          prefs.setInt("idUser", u.id);
          prefs.setString("role", u.roleNames);
          //print(user["userName"]);
          subscribeStomp();
          //postNotifications();
          print("this is prefs " + prefs.get("idUser").toString());
          switch(user["roleNames"]) {
            case "manager": {
              // statements;
              Get.offNamed("/navigator1");
            }
            break;
            case "agent": {
              //statements;
              Get.toNamed("/navigator2");
            }
            break;
            case "agentt": {
              //statements;
              Get.toNamed("/ageDuStock");
            }
            break;
            case "agenttt": {
              //statements;
              Get.toNamed("/fiabilitePasse");
            }
            break;
            /*default: {
              //statements;
            }
            break;*/
          }
          Get.context.hideLoaderOverlay();

        }
      else{
        //Alert(message: 'Test', shortDuration: false).show();
        Get.context.hideLoaderOverlay();
        Alert(context: Get.context, title: "Connexion echouée", desc: "nom d'utilisateur ou mot de passe incorrect").show();
        print("Alert mdp false");
        return false;
      }

    }
    else {
      Alert(context: Get.context, title: "connexion inexistante", desc: "erreur a la connexion au serveur").show();
      print("cudnt get user");
      throw Exception("cant verify user");
    }
  }
}