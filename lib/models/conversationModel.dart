import 'chatMessageModel.dart';
import 'dart:convert';

class Conversation{
  int _id;
  String _participantsIds;
  String _description;
  DateTime _dateModification;
  DateTime _dateCreation;
  //DateTime _dateSuppression;
  //bool _blSuppression;
  List<ChatMessage> _chatMessages;


  factory Conversation.fromJson(Map<String, dynamic> json) {
    List<ChatMessage> msgs = [];
    for(int i=0; i<json['chatMessages'].length; i++)
      {
        msgs.add(ChatMessage.fromJson(json['chatMessages'][i]));
       // print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii" + json['chatMessages'][i].toString() );
      }
    DateTime dateM, dateC;

    if(json['dateModification'] != null) {
      dateM = DateTime.fromMicrosecondsSinceEpoch(json['dateModification'] * 1000);
    }
    if(json['dateCreation'] != null) {
      dateC = DateTime.fromMicrosecondsSinceEpoch(json['dateCreation'] * 1000);
      print(dateC);
    }
    return Conversation(id : json['id'],
    participantsIds : json['participantsIds'] as String,
    description : json['description'] as String,
    dateCreation : dateC,
    dateModification : dateM ,
    //dateSuppression : DateTime.fromMicrosecondsSinceEpoch(json['dateSuppression']),
    chatMessages : msgs,
    ) ;
  }

  Map<String, dynamic> toJson(){
    int intTimeCreation, intTimeModification;
    if(_dateCreation !=null)
      intTimeCreation = this._dateCreation.millisecondsSinceEpoch;
    if(_dateModification !=null)
      intTimeModification = this._dateModification.millisecondsSinceEpoch;
  List<Map<String, dynamic>> list = [];
  if(_chatMessages != null) {
    for (int i = 0; i < _chatMessages.length; i++) {
      list.add(_chatMessages[i].toJson());
    }
  }
  return {
    "id": this._id,
    "participantsIds": this._participantsIds,
    "description": this._description,
    "dateModification": intTimeModification,
    "dateCreation": intTimeCreation,
    "chatMessages": list,

  };
}
  Conversation({
      int id,
      String participantsIds,
      String description,
      DateTime dateModification,
      DateTime dateCreation,
      DateTime dateSuppression,
      //this._blSuppression,
      List<ChatMessage> chatMessages}): _id = id, _participantsIds = participantsIds, _description = description,
            _dateModification = dateModification, _dateCreation = dateCreation,
            _chatMessages = chatMessages;

  List<ChatMessage> get chatMessages => _chatMessages;

  set chatMessages(List<ChatMessage> value) {
    _chatMessages = value;
  }

  DateTime get dateCreation => _dateCreation;

  set dateCreation(DateTime value) {
    _dateCreation = value;
  }

  DateTime get dateModification => _dateModification;

  set dateModification(DateTime value) {
    _dateModification = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get participantsIds => _participantsIds;

  set participantsIds(String value) {
    _participantsIds = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  @override
  String toString() {
    return 'Conversation{_id: $_id, _participantsIds: $_participantsIds, _description: $_description, _dateModification: $_dateModification, _dateCreation: $_dateCreation, _chatMessages: $_chatMessages}';
  }
}