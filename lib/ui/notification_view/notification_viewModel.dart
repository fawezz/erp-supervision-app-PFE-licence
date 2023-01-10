
import 'package:application_de_supervision/app/httpService.dart';
import 'package:application_de_supervision/models/notificationGpaoModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';



class NotificationViewModel extends BaseViewModel {

  final List<String> titres = ["Commande Non Reservée Accessoire","Commande Non Reservée Composant", "Commande Non Planifiée", "IMPACT EHD"];
  final List<Color> colors = [Colors.teal,Colors.green[200], Colors.redAccent[100],Colors.blueAccent[100]];
  /////////////////////////////////////////////Variable Afficher///////////////////////////////////////////
  List<NotificationGpao> _notifications = serviceNotifications != null? serviceNotifications : [];

  List<NotificationGpao> get notifications => _notifications;


Color getColor(String typeDesignation){
  int index = titres.indexOf(typeDesignation);
  if(index<0)
    return Colors.white;
  Color selectedColor = colors.elementAt(index);
  return selectedColor;
}

/////////////////////////////////////////////Action Afficher///////////////////////////////////////////


}

