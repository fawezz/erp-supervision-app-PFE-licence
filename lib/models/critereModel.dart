class Critere {
  int _id;
  String _nom;
  String _type;
  int _siteId;
  int _produitId;
  int _sfProduitId;
  int _clientId;
  int _themeId;
  int _userId;
  int _dateDe;
  int _dateA;
  int _dateIntroduction;
  String _observations;

  Critere(
      {int id,
        String nom,
        String type,
        int siteId,
        int produitId,
        int sfProduitId,
        int clientId,
        int themeId,
        int userId,
        int dateDe,
        int dateA,
        int dateIntroduction,
        String observations}) {
    this._id = id;
    this._nom = nom;
    this._type = type;
    this._siteId = siteId;
    this._produitId = produitId;
    this._sfProduitId = sfProduitId;
    this._clientId = clientId;
    this._themeId = themeId;
    this._userId = userId;
    this._dateDe = dateDe;
    this._dateA = dateA;
    this._dateIntroduction = dateIntroduction;
    this._observations = observations;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get nom => _nom;
  set nom(String nom) => _nom = nom;
  String get type => _type;
  set type(String type) => _type = type;
  int get siteId => _siteId;
  set siteId(int siteId) => _siteId = siteId;
  int get produitId => _produitId;
  set produitId(int produitId) => _produitId = produitId;
  int get sfProduitId => _sfProduitId;
  set sfProduitId(int sfProduitId) => _sfProduitId = sfProduitId;
  int get clientId => _clientId;
  set clientId(int clientId) => _clientId = clientId;
  int get themeId => _themeId;
  set themeId(int themeId) => _themeId = themeId;
  int get userId => _userId;
  set userId(int userId) => _userId = userId;
  int get dateDe => _dateDe;
  set dateDe(int dateDe) => _dateDe = dateDe;
  int get dateA => _dateA;
  set dateA(int dateA) => _dateA = dateA;
  int get dateIntroduction => _dateIntroduction;
  set dateIntroduction(int dateIntroduction) =>
      _dateIntroduction = dateIntroduction;
  String get observations => _observations;
  set observations(String observations) => _observations = observations;

  Critere.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _nom = json['nom'];
    _type = json['type'];
    _siteId = json['siteId'];
    _produitId = json['produitId'];
    _sfProduitId = json['sfProduitId'];
    _clientId = json['clientId'];
    _themeId = json['themeId'];
    _userId = json['userId'];
    _dateDe = json['dateDe'];
    _dateA = json['dateA'];
    _dateIntroduction = json['dateIntroduction'];
    _observations = json['observations'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['nom'] = this._nom;
    data['type'] = this._type;
    data['siteId'] = this._siteId;
    data['produitId'] = this._produitId;
    data['sfProduitId'] = this._sfProduitId;
    data['clientId'] = this._clientId;
    data['themeId'] = this._themeId;
    data['userId'] = this._userId;
    data['dateDe'] = this._dateDe;
    data['dateA'] = this._dateA;
    data['dateIntroduction'] = this._dateIntroduction;
    data['observations'] = this._observations;
    return data;
  }

  @override
  String toString() {
    return 'Critere{_id: $_id, _nom: $_nom, _type: $_type, _siteId: $_siteId, _produitId: $_produitId, _sfProduitId: $_sfProduitId, _clientId: $_clientId, _themeId: $_themeId, _userId: $_userId, _dateDe: $_dateDe, _dateA: $_dateA, _dateIntroduction: $_dateIntroduction, _observations: $_observations}';
  }
}
