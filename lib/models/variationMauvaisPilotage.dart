///La reponse de postVariationMauvaisPilotage
class VariationMauvaisPilotage {
  int _id;
  int _idSite;
  int _partieInterresId;
  int _semaine;
  int _annee;
  int _mois;
  int _nonPlanif;
  int _planifPasse;
  int _mauvaisPilotage;
  int _qteEnCours;
  String _partieInterresAbreviation;
  String _siteDesignation;
  int _mauvaisPilotageCoupe;

  VariationMauvaisPilotage(
      {int id,
        int idSite,
        int partieInterresId,
        int semaine,
        int annee,
        int mois,
        int nonPlanif,
        int planifPasse,
        int mauvaisPilotage,
        int qteEnCours,
        String partieInterresAbreviation,
        String siteDesignation,
        int mauvaisPilotageCoupe}) {
    this._id = id;
    this._idSite = idSite;
    this._partieInterresId = partieInterresId;
    this._semaine = semaine;
    this._annee = annee;
    this._mois = mois;
    this._nonPlanif = nonPlanif;
    this._planifPasse = planifPasse;
    this._mauvaisPilotage = mauvaisPilotage;
    this._qteEnCours = qteEnCours;
    this._partieInterresAbreviation = partieInterresAbreviation;
    this._siteDesignation = siteDesignation;
    this._mauvaisPilotageCoupe = mauvaisPilotageCoupe;
  }

  int get id => _id;
  set id(int id) => _id = id;
  int get idSite => _idSite;
  set idSite(int idSite) => _idSite = idSite;
  int get partieInterresId => _partieInterresId;
  set partieInterresId(int partieInterresId) =>
      _partieInterresId = partieInterresId;
  int get semaine => _semaine;
  set semaine(int semaine) => _semaine = semaine;
  int get annee => _annee;
  set annee(int annee) => _annee = annee;
  int get mois => _mois;
  set mois(int mois) => _mois = mois;
  int get nonPlanif => _nonPlanif;
  set nonPlanif(int nonPlanif) => _nonPlanif = nonPlanif;
  int get planifPasse => _planifPasse;
  set planifPasse(int planifPasse) => _planifPasse = planifPasse;
  int get mauvaisPilotage => _mauvaisPilotage;
  set mauvaisPilotage(int mauvaisPilotage) =>
      _mauvaisPilotage = mauvaisPilotage;
  int get qteEnCours => _qteEnCours;
  set qteEnCours(int qteEnCours) => _qteEnCours = qteEnCours;
  String get partieInterresAbreviation => _partieInterresAbreviation;
  set partieInterresAbreviation(String partieInterresAbreviation) =>
      _partieInterresAbreviation = partieInterresAbreviation;
  String get siteDesignation => _siteDesignation;
  set siteDesignation(String siteDesignation) =>
      _siteDesignation = siteDesignation;
  int get mauvaisPilotageCoupe => _mauvaisPilotageCoupe;
  set mauvaisPilotageCoupe(int mauvaisPilotageCoupe) =>
      _mauvaisPilotageCoupe = mauvaisPilotageCoupe;

  VariationMauvaisPilotage.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _idSite = json['idSite'];
    _partieInterresId = json['partieInterresId'];
    _semaine = json['semaine'];
    _annee = json['annee'];
    _mois = json['mois'];
    _nonPlanif = json['nonPlanif'];
    _planifPasse = json['planifPasse'];
    _mauvaisPilotage = json['mauvaisPilotage'];
    _qteEnCours = json['qteEnCours'];
    _partieInterresAbreviation = json['partieInterresAbreviation'];
    _siteDesignation = json['siteDesignation'];
    _mauvaisPilotageCoupe = json['mauvaisPilotageCoupe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['idSite'] = this._idSite;
    data['partieInterresId'] = this._partieInterresId;
    data['semaine'] = this._semaine;
    data['annee'] = this._annee;
    data['mois'] = this._mois;
    data['nonPlanif'] = this._nonPlanif;
    data['planifPasse'] = this._planifPasse;
    data['mauvaisPilotage'] = this._mauvaisPilotage;
    data['qteEnCours'] = this._qteEnCours;
    data['partieInterresAbreviation'] = this._partieInterresAbreviation;
    data['siteDesignation'] = this._siteDesignation;
    data['mauvaisPilotageCoupe'] = this._mauvaisPilotageCoupe;
    return data;
  }
}