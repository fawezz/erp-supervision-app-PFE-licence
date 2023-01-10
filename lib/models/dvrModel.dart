class DVR {
  int _id;
  String _titre;
  String _type;
  String _ipAdress;
  int _port;
  String _userName;
  String _password;
  int _nbrCamera;
  String _rtsp;
  bool _active; //not added to the rest of the model
  int _idSite;  //same

  DVR(
      {int id,
        String titre,
        String type,
        String ipAdress,
        int port,
        String userName,
        String password,
        int nbrCamera,
        String rtsp}) {
    this._id = id;
    this._titre = titre;
    this._type = type;
    this._ipAdress = ipAdress;
    this._port = port;
    this._userName = userName;
    this._password = password;
    this._nbrCamera = nbrCamera;
    this._rtsp = rtsp;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get titre => _titre;
  set titre(String titre) => _titre = titre;
  String get type => _type;
  set type(String type) => _type = type;
  String get ipAdress => _ipAdress;
  set ipAdress(String ipAdress) => _ipAdress = ipAdress;
  int get port => _port;
  set port(int port) => _port = port;
  String get userName => _userName;
  set userName(String userName) => _userName = userName;
  String get password => _password;
  set password(String password) => _password = password;
  int get nbrCamera => _nbrCamera;
  set nbrCamera(int nbrCamera) => _nbrCamera = nbrCamera;
  String get rtsp => _rtsp;
  set rtsp(String rtsp) => _rtsp = rtsp;

  DVR.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _titre = json['titre'];
    _type = json['type'];
    _ipAdress = json['ipAdress'];
    _port = json['port'];
    _userName = json['userName'];
    _password = json['password'];
    _nbrCamera = json['nbrCamera'];
    _rtsp = json['rtsp'];
  }

}