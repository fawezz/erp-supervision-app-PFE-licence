class NotificationGpao {
  int _id;
  String _type;
  String _alerte;
  DateTime _date;
  bool _traite;
  int _idClient;
  int _idType;
  String _client;
  String _numeroOF;
  String _referenceProduit;
  String _marque;
  int _idMarque;
  int _quantite;
  int _idSite;
  DateTime _dateTraitement;
  String _typeDesignation;
  DateTime _dateLivraison;

  NotificationGpao(
      {int id,
        String type,
        String alerte,
        DateTime date,
        bool traite,
        int idClient,
        int idType,
        String client,
        String numeroOF,
        String referenceProduit,
        String marque,
        int idMarque,
        int quantite,
        int idSite,
        DateTime dateTraitement,
        String typeDesignation,
        DateTime dateLivraison}) {
    this._id = id;
    this._type = type;
    this._alerte = alerte;
    this._date = date;
    this._traite = traite;
    this._idClient = idClient;
    this._idType = idType;
    this._client = client;
    this._numeroOF = numeroOF;
    this._referenceProduit = referenceProduit;
    this._marque = marque;
    this._idMarque = idMarque;
    this._quantite = quantite;
    this._idSite = idSite;
    this._dateTraitement = dateTraitement;
    this._typeDesignation = typeDesignation;
    this._dateLivraison = dateLivraison;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get type => _type;
  set type(String type) => _type = type;
  String get alerte => _alerte;
  set alerte(String alerte) => _alerte = alerte;
  DateTime get date => _date;
  set date(DateTime date) => _date = date;
  bool get traite => _traite;
  set traite(bool traite) => _traite = traite;
  int get idClient => _idClient;
  set idClient(int idClient) => _idClient = idClient;
  int get idType => _idType;
  set idType(int idType) => _idType = idType;
  String get client => _client;
  set client(String client) => _client = client;
  String get numeroOF => _numeroOF;
  set numeroOF(String numeroOF) => _numeroOF = numeroOF;
  String get referenceProduit => _referenceProduit;
  set referenceProduit(String referenceProduit) =>
      _referenceProduit = referenceProduit;
  String get marque => _marque;
  set marque(String marque) => _marque = marque;
  int get idMarque => _idMarque;
  set idMarque(int idMarque) => _idMarque = idMarque;
  int get quantite => _quantite;
  set quantite(int quantite) => _quantite = quantite;
  int get idSite => _idSite;
  set idSite(int idSite) => _idSite = idSite;
  DateTime get dateTraitement => _dateTraitement;
  set dateTraitement(DateTime dateTraitement) => _dateTraitement = dateTraitement;
  String get typeDesignation => _typeDesignation;
  set typeDesignation(String typeDesignation) =>
      _typeDesignation = typeDesignation;
  DateTime get dateLivraison => _dateLivraison;
  set dateLivraison(DateTime dateLivraison) => _dateLivraison = dateLivraison;

  NotificationGpao.fromJson(Map<String, dynamic> json) {
    DateTime _timestampDate ;
    DateTime _timestampTraitement;
    DateTime _timestampLivraison;

    if(json['date'] != null){
      _timestampDate = DateTime.fromMicrosecondsSinceEpoch(json['date'] * 1000);
    }
    if(json['dateTraitement'] != null){
      _timestampTraitement = DateTime.fromMicrosecondsSinceEpoch(json['dateTraitement'] * 1000);
    }
    if(json['dateLivraison'] != null){
      _timestampLivraison = DateTime.fromMicrosecondsSinceEpoch(json['dateLivraison'] * 1000);
    }
    _id = json['id'];
    _type = json['type'];
    _alerte = json['alerte'];
    _date = _timestampDate;
    _traite = json['traite'];
    _idClient = json['idClient'];
    _idType = json['idType'];
    _client = json['client'];
    _numeroOF = json['numeroOF'];
    _referenceProduit = json['referenceProduit'];
    _marque = json['marque'];
    _idMarque = json['idMarque'];
    _quantite = json['quantite'];
    _idSite = json['idSite'];
    _dateTraitement = _timestampTraitement;
    _typeDesignation = json['typeDesignation'];
    _dateLivraison = _timestampLivraison;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['type'] = this._type;
    data['alerte'] = this._alerte;
    data['date'] = this._date;
    data['traite'] = this._traite;
    data['idClient'] = this._idClient;
    data['idType'] = this._idType;
    data['client'] = this._client;
    data['numeroOF'] = this._numeroOF;
    data['referenceProduit'] = this._referenceProduit;
    data['marque'] = this._marque;
    data['idMarque'] = this._idMarque;
    data['quantite'] = this._quantite;
    data['idSite'] = this._idSite;
    data['dateTraitement'] = this._dateTraitement;
    data['typeDesignation'] = this._typeDesignation;
    data['dateLivraison'] = this._dateLivraison;
    return data;
  }

  @override
  String toString() {
    return 'NotificationGpao{_id: $_id, _type: $_type, _alerte: $_alerte, _date: $_date, _traite: $_traite, _idClient: $_idClient, _idType: $_idType, _client: $_client, _numeroOF: $_numeroOF, _referenceProduit: $_referenceProduit, _marque: $_marque, _idMarque: $_idMarque, _quantite: $_quantite, _idSite: $_idSite, _dateTraitement: $_dateTraitement, _typeDesignation: $_typeDesignation, _dateLivraison: $_dateLivraison}';
  }
}