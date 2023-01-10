import 'dart:convert';

import 'package:application_de_supervision/app/Constants.dart';
import 'package:application_de_supervision/app/sharedPrefsService.dart';
import 'package:application_de_supervision/app/stompService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:get/get.dart';


class DashboardPrincipaleViewModel extends BaseViewModel {
Future<void> deconnecter() async {
  SharedPrefsSerivce.wipe();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("firstName");
  prefs.remove("idUser");
  prefs.remove("role");
  try{
    deconnectStomp();
  }catch(e){
    print(e.toString());
  }
  //deconnect postNotification
  Get.offAndToNamed("/login");
}

}

