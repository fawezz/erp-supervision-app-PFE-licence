import 'dart:convert';

import 'package:application_de_supervision/models/clientCacheModel.dart';
import 'package:application_de_supervision/models/produitModel.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'package:application_de_supervision/models/siteModel.dart';

class SecondViewModel extends BaseViewModel {

  Uri getCacheClientAdresse = Uri.parse(
      "http://10.0.2.2:8033/ma-gpro-gpao-rest/gestionProduitAOCache/listeClientCache");
  Uri getSiteAdresse = Uri.parse(
      "http://10.0.2.2:8033/mt-gpro-commun-rest/gestionnaireCache/listeSitePartieInteresseeCache");
  Uri getProduitAdresse = Uri.parse(
      "http://10.0.2.2:8033/mt-gpro-commun-rest/produit/all");

  List _references = [];
  List get references {
    getReferenceProduits();
    return _references;

  }


  Future<List<ClientCache>> getClientsCache() async {
    http.Response res = await http.get(getCacheClientAdresse);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<ClientCache> clients = body.map((dynamic item) =>
          ClientCache.fromJson(item)).toList();
      return clients;
    } else {
      throw "cant get clients";
    }
  }

  Future<List<Site>> getSites() async {
    http.Response res = await http.get(getSiteAdresse);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Site> sites = body.map((dynamic item) =>
          Site.fromJson(item)).toList();
      return sites;
    } else {
      throw "cant get sites";
    }
  }

  Future<List<Produit>> getProduits() async {
    http.Response res = await http.get(getProduitAdresse);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Produit> produits = body.map((dynamic item) =>
          Produit.fromJson(item)).toList();
      return produits;
    } else {
      throw "cant get sites";
    }
  }

  void getReferenceProduits() async {
    List produits = await getProduits();

    for(var p in produits)
    {
      _references.add(p.reference);
    }
    notifyListeners();

  }
}

