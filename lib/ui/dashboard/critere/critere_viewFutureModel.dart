import 'dart:convert';

import 'package:application_de_supervision/app/Constants.dart';
import 'package:application_de_supervision/app/httpService.dart';
import 'package:application_de_supervision/models/critereModel.dart';
import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;



class CritereViewFutureModel extends FutureViewModel<List<dynamic>> {

  final List<String> types = [
    "Mauvais_Pilotage",
    "Fiabilite_Actuelle",
    "Fiabilite_Passe"
  ];



  String _selectedType = "Mauvais_Pilotage".toUpperCase();

  String get selectedType => _selectedType;

  void updateSelectedType(value) {
    _selectedType = value;
    notifyListeners();
  }

  List<S2Choice<String>> options = [];

  String _nom;
  String get nom =>_nom;
  void setNom(String ch){
    _nom = ch;
  }

  String _observations;
  String get observations =>_observations;
  void setObservations(String ch){
    _observations = ch;
  }

  /*bool allSelected(){
    return
    //return   (_selectedType != "0") && (_selectedIdSite != 0) && (_selectedIdSite != 0) &&
        //(_selectedIdProduit != 0) && (_selectedIdClient != 0);
  }*/
  /////////////////////////////////////////////Variable Afficher///////////////////////////////////////////

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

  Future<int> valider () async {

    Critere newCritere = Critere(nom: _nom, clientId: _selectedIdClient, produitId: _selectedIdProduit,
        siteId: _selectedIdSite,type: _selectedType, observations: _observations);

    var parameters = newCritere.toJson();
    Uri postDataUri = Uri.parse(fPostCreerCritereAdress);

    http.Response response = await http.post(postDataUri,body: jsonEncode(parameters), headers: {"Content-type": "application/json", "Connection":"keep-alive",
      "Accept": "application/json"});
    print(response.statusCode.toString());

    print(response.body.toString());
    return response.statusCode;

  }

  Future<List<void>> loadLists() async {
    if(_listClients.isEmpty) {
      options = types.map((value) {
        return S2Choice<String>(value: value.toUpperCase(), title: value);
      }).toList();

      loadListProduits();
      loadListClients();
      loadListSites();
    }
  }

  @override
  Future<List<void>> futureToRun() => loadLists();


}
