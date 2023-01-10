import 'package:flutter/cupertino.dart';

class Site {
  final int id;
  final String nom;

  Site({@required this.id, @required this.nom});

  factory Site.fromJson(Map<String, dynamic> json) {
    return Site(
        id: json['id'] as int,
        nom: json['nom'] as String
    );
  }

}