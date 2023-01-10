class ChatMessage{
  int _id;
  int _conversation;
  String _participantsIds;
  int _senderId;
  String _senderName;
  String _description;
  String _message;
  DateTime _timestamp;
  String _etat;

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    //print("ENTERED FROM JSON OF CHATMESSAGE");
    DateTime _timestamp ;
    if(json['timestamp'] != null){
     _timestamp = DateTime.fromMicrosecondsSinceEpoch(json['timestamp'] * 1000);
    }
    return ChatMessage(id : json['id'],
      participantsIds : json['participantsIds'],
      senderId : json['senderId'],
      senderName : json['senderName'],
      description : json['description'],
      message : json['message'],
      timestamp : _timestamp,
      etat : json['etat'],
      conversation: json['conversation'],
    );
    //_conversation = json['conversation'];
  }

  Map<String, dynamic> toJson(){
    int intTime;
    if(_timestamp !=null)
      intTime = this._timestamp.millisecondsSinceEpoch;
    return {
      "id": this._id,
      "conversation": _conversation,
      "participantsIds": this._participantsIds,
      "description": this._description,
      "senderName": this._senderName,
      "senderId": this._senderId,
      "etat": this._etat,
      "timestamp": intTime,
      "message": this._message
    };
  }

  ChatMessage({int id, String participantsIds, int senderId, String senderName, String description,
  String message, DateTime timestamp, String etat, int conversation}):
      _id = id,
      _conversation = conversation,
      _participantsIds = participantsIds,
      _senderId = senderId,
      _senderName = senderName,
      _description = description,
      _message = message,
      _timestamp = timestamp,
      _etat = etat;


  set id(int value) {
    _id = value;
  }

  int get id => _id;

  String get etat => _etat;

  set etat(String value) {
    _etat = value;
  }

  DateTime get timestamp => _timestamp;

  set timestamp(DateTime value) {
    _timestamp = value;
  }

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get senderName => _senderName;

  set senderName(String value) {
    _senderName = value;
  }

  int get senderId => _senderId;

  set senderId(int value) {
    _senderId = value;
  }

  String get participantsIds => _participantsIds;

  set participantsIds(String value) {
    _participantsIds = value;
  }

  int get conversation => _conversation;

  set conversation(int value) {
    _conversation = value;
  }

  @override
  String toString() {
    return 'ChatMessage{_id: $_id, _conversation: $_conversation, _participantsIds: $_participantsIds, _senderId: $_senderId, _senderName: $_senderName, _description: $_description, _message: $_message, _timestamp: $_timestamp, _etat: $_etat}';
  }
}