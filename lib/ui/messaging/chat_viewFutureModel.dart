
import 'dart:convert';
import 'dart:core';
import 'package:application_de_supervision/app/httpService.dart';
import 'package:application_de_supervision/models/chatMessageModel.dart';
import 'package:application_de_supervision/models/conversationModel.dart';
import 'package:application_de_supervision/models/userModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChatViewFutureModel extends FutureViewModel<List<dynamic>> {

  List _conversations = [];
  List<User> _users = [];

  List<String> _generatedNames = [];

  List get generatedNames => _generatedNames;
  List get conversations => _conversations;
  List get users => _users;

  /*List<User> search(String toFind){

    List<User> result = [];
    if(_users.length>0)
      {
        for(User u in _users)
          {
            if(u.firstName.contains(toFind) ||u.lastName.contains(toFind))
              result.add(u);
            notifyListeners();
          }
      }
    return result;
  }*/
  void generateNames(){
    print("entered generate names function");

    ///Problem not all users show up fel lista even though they all get here from the back
    /*for(int i = 0; i<_users.length; i++)
      {
        print(_users[i].toString());
      }*/
    for(User u in _users)
      {
        String ch = u.firstName + " " + u.lastName ;
        _generatedNames.add(ch);
        notifyListeners();
       //print(ch);
        //print( _generatedNames);
      }
    print( _generatedNames);


  }

  Future<List<void>> getData() async {
    //print("------------------------------------------------" + _conversations.toString());
    _conversations = await getConversations();
    if(_users.length==0) {
      //print("HAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      _users = await getUsers();
      generateNames();
      //print("uuuuuuuuuuuuuuuuuuuuuuuuu" + _users.toString());

    }
    //print("+++++++++++++++++++++++++++++++++++++++++++++++++" + _conversations.toString());

    //_users = getUsers() as List<User>;


  }
  @override
  Future<List<void>> futureToRun() => getData();

}