
class Produit {
  final int id;
  final String familleDesignation;
  final int partieIntersseID;
  final String partieIntersseDesignation;
  final String reference;
  final String designation;

  Produit({this.id, this.familleDesignation, this.partieIntersseID, this.partieIntersseDesignation, this.reference, this.designation});

  factory Produit.fromJson(Map<String, dynamic> json) {
    return Produit(
        id: json['id'] as int,
        reference: json['reference'] as String,
        familleDesignation: json['familleDesignation'],
        partieIntersseID: json['partieIntersseID'],
        partieIntersseDesignation: json['partieIntersseDesignation'],
        designation: json['designation'],

    );
  }
}