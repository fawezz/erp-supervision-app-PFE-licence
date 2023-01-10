import 'dart:convert';

import 'package:application_de_supervision/app/Constants.dart';
import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'package:application_de_supervision/models/critereModel.dart';
import 'package:application_de_supervision/app/httpService.dart';


class FiabiliteActuelViewFutureModel extends FutureViewModel<List<dynamic>> {


  List<S2Choice<int>> _listProduits = [];

  List get listProduits => _listProduits;


  int _selectedIdProduit = 0;

  int get selectedIdProduit => _selectedIdProduit;

  void setSelectedIdProduit(int value) {
    _selectedIdProduit = value;
    notifyListeners();
  }

  /////////////////////////////////////////////Dropdown Liste Produits///////////////////////////////////////////
  void loadListProduits() async {
    List produits = await getProduits();
    //_selectedIdProduit = produits[0].id;

    // print(_listProduits.length.toString());
    if (_listProduits.length == 0) {
      for (var p in produits) {
        _listProduits.add(
            S2Choice<int>(value: p.id, title: p.reference.toString()));
        notifyListeners();
      }
    }
    print(_listProduits.toString());
  }

//////////////////////////////////////////////Variables Clients////////////////////////////////////////////////
  List<S2Choice<int>> _listClients = [];

  List get listClients => _listClients;

  int _selectedIdClient = 0;

  int get selectedIdClient => _selectedIdClient;

  void setSelectedIdClient(int value) {
    _selectedIdClient = value;
    notifyListeners();
  }

  /////////////////////////////////////////////Dropdown Liste Clients///////////////////////////////////////////
  void loadListClients() async {
    List clients = await getClientsCache();
    //_selectedIdClient = clients[0].id;
    // print(_listClients.length.toString());
    if (_listClients.length == 0) {
      for (var c in clients) {
        _listClients.add(S2Choice<int>(value: c.id, title: c.abreviation));
        notifyListeners();
        //print("Clienttttttttttt" + c.id.toString());
      }
    }
  }

  /////////////////////////////////////////////Variables Site///////////////////////////////////////////////
  List<S2Choice<int>> _listSites = [];

  List get listSites => _listSites;

  int _selectedIdSite = 0;

  int get selectedIdSite => _selectedIdSite;

  void setSelectedIdSite(int value) {
    _selectedIdSite = value;
    notifyListeners();
  }

  /////////////////////////////////////////////Dropdown Liste Site///////////////////////////////////////////
  void loadListSites() async {
    List sites = await getSites();
    //_selectedIdSite = sites[0].id;

    if (_listSites.length == 0) {
      for (var c in sites) {
        _listSites.add(S2Choice<int>(value: c.id, title: c.nom));
        notifyListeners();
      }
    }
  }


  Future<List<void>> loadLists() async {
    if(_listClients.isEmpty) {
      loadListProduits();
      loadListClients();
      loadListSites();
    }
      return null;
  }
  /////////////////////////////////////////////Variable Afficher///////////////////////////////////////////

  double _sommeNonPlanifie;
  double get sommeNonPlanifie => _sommeNonPlanifie;

  double _sommeEnCours;
  double get sommeEnCours => _sommeEnCours;

  double _pourcentEnCours;
  double get pourcentEnCours => _pourcentEnCours;

  double _pourcentNonPlanifie;
  double get pourcentNonPlanifie => _pourcentNonPlanifie;
  /////////////////////////////////////////////Action Afficher///////////////////////////////////////////

  Future<void> postDataActuelle() async {
    var parameters = jsonEncode( {
      'clientId': _selectedIdClient,
      'produitId': _selectedIdProduit,
      'siteId': _selectedIdSite,

    });

      Uri postDataUri = Uri.parse(fPostFiabiliteActuelAdress);

      http.Response response =
          await http.post(postDataUri, body: parameters, headers: {
        "Content-type": "application/json",
        "Connection": "keep-alive",
        "Accept": "application/json"
      });
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);

        _sommeNonPlanifie = body["NonPlanifie"]["sommeQteOf"].toDouble();
        _sommeEnCours = body["enCours"]["sommeQteOf"].toDouble();

        notifyListeners();

      } else {
        throw Exception("cant get sites");
      }
    }



  @override
  Future<List<void>> futureToRun() => loadLists();

}

