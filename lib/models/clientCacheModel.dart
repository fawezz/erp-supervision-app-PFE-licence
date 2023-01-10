import 'package:flutter/cupertino.dart';

class ClientCache {
  final int id;
  final String abreviation;

  ClientCache({ @required this.id, @required this.abreviation});

  factory ClientCache.fromJson(Map<String, dynamic> json) {
    return ClientCache(
        id: json['id'] as int,
        abreviation: json['abreviation'] as String
    );
  }
}