import 'package:application_de_supervision/app/designConstants.dart';
import 'package:application_de_supervision/app/sharedPrefsService.dart';
import 'package:application_de_supervision/models/chatMessageModel.dart';
import 'package:application_de_supervision/models/conversationModel.dart';
import 'package:application_de_supervision/models/userModel.dart';
import 'package:auto_search/auto_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'chat_detail_ViewModel.dart';
import 'package:get/get.dart';

import 'create_conversation_viewModel.dart';

class CreateConversationView extends StatelessWidget {
  CreateConversationView({Key key}) : super(key: key);


  //tefinal r = Navigator.of(Get.context).popAndPushNamed("/chat");

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: appBarColor,
              automaticallyImplyLeading: false,
              leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: (){
                Get.back();
                },),
              title: Text("Nouvelle conversation"),

            ),
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  model.selectedUsers.isEmpty? Container(height: 70,):
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 70,   ///the height of each bulle of new user
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: model.selectedUsers.length,
                      padding: EdgeInsets.all( 10),
                      itemBuilder: (context, indexx) {
                        //List list = model.selectedUsers.entries.map((e) => e.value).toList();
                        print(model.listOfSelected.toString());
                        List<dynamic> list = model.listOfSelected;
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Padding(  //necessary
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text(list[indexx].firstName + " " + list[indexx].lastName,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),

                                  GestureDetector(
                                      onTap: (){
                                        model.removeSelectedUser(model.listOfSelected[indexx]);
                                      },
                                      child: Icon(FontAwesomeIcons.timesCircle, color: Colors.red, size: 24,))
                                ],),
                            ),),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: SizedBox(
                      height: 450,
                      child: AutoSearchInput(
                        data: model.names,
                        maxElementsToDisplay: 5,
                        itemsShownAtStart: 5,
                        borderRadius: 36,

                        onItemTap: (int index) {
                          model.updateSelectedUsers(index);
                        }
                ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: SizedBox(
                        width: 120,
                        child: ElevatedButton(
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Verifier", style: TextStyle(fontSize: 18),),
                            Icon(Icons.check),
                          ],
                        ), onPressed: (){
                            model.createCurrentConv().then((value) {
                              //Get.back();
                              Get.toNamed("/chatDetail", arguments: {
                                "description": model.description,
                                "currentConversation": model.newConversation}).then((value) {
                                print('INSIDE SET STAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAATE');
                                //Get.back();
                                if(SharedPrefsSerivce.prefs.getString("role") == "manager")
                                  Get.offAndToNamed("/navigator1", arguments: {"tabNumber": 1});
                                else
                                  {
                                    Get.offAndToNamed("/navigator2", arguments: {"tabNumber": 1});
                                  }
                              });
                              print("create conversation view: " + model.newConversation.toString());
                            });
                            },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
      viewModelBuilder: () => CreateConversationModel(),

    );
  }
}
