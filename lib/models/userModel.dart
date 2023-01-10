class User {
  int _id;
  String _userName;
  String _password;
  String _firstName;
  String _lastName;
  String _email;
  String _phoneNumber;
  bool _enabled;
  //String _version;
  String _roleNames;
  List<String> _listRoles;
  int _atelierId;
  int _clientId;
  int _familleTissuId;
  int _familleFournitureId;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _userName = json['userName'];
    _password = json['password'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _phoneNumber = json['phoneNumber'];
    _enabled = json['enabled'];
    _roleNames = json['roleNames'];
    _atelierId = json['atelierId'];
    _clientId = json['clientId'];
    _familleTissuId = json['familleTissuId'];
    _familleFournitureId = json['familleFournitureId'];
  }

  String get userName => _userName;

  int get familleFournitureId => _familleFournitureId;

  set familleFournitureId(int value) {
    _familleFournitureId = value;
  }

  int get familleTissuId => _familleTissuId;

  set familleTissuId(int value) {
    _familleTissuId = value;
  }

  int get clientId => _clientId;

  set clientId(int value) {
    _clientId = value;
  }

  int get atelierId => _atelierId;

  set atelierId(int value) {
    _atelierId = value;
  }

  List<String> get listRoles => _listRoles;

  set listRoles(List<String> value) {
    _listRoles = value;
  }

  String get roleNames => _roleNames;

  set roleNames(String value) {
    _roleNames = value;
  }

  bool get enabled => _enabled;

  set enabled(bool value) {
    _enabled = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  set userName(String value) {
    _userName = value;
  }

  @override
  String toString() {
    return 'User{_id: $_id, _userName: $_userName, _firstName: $_firstName, _lastName: $_lastName}';
  }
}