import 'package:application_de_supervision/ui/startup/startup_viewmodel.dart';
import 'package:application_de_supervision/widgets/menu_card.dart';
import 'package:application_de_supervision/widgets/navDrawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:get/get.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          //appBar: AppBar(),
          ///////////////////////////////////////////drawer/////////////////////////////////
          //drawer: navDrawer(),
          ////////////////////////////////////////////body/////////////////////////////////////
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [ Colors.blue, Colors.lightGreen,]
                )
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                            MenuCard(text: "Production", icon: FontAwesomeIcons.industry, action:"/variationPilotage"),
                            MenuCard(text: "Stock", icon: FontAwesomeIcons.edit, action:""),

                        /*Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MenuCard(text: "Achat", icon: FontAwesomeIcons.cashRegister, action:""),
                            MenuCard(text: "Vente", icon: Icons.shopping_bag, action:""),
                          ],
                        )*/
                      ],
                    ),
            ),
          ),
              ),
        ),
        viewModelBuilder: () => StartUpViewModel(),
    );
  }
}




/*body: Center(
            child: Column(
              children: [
                Text("StartUp view", style: TextStyle(fontSize: 26),),
                ElevatedButton(onPressed: (){
                  Get.toNamed("/login");
                },
                    child: Text("Navigate to Login")),
                ElevatedButton(onPressed: (){
                  Get.toNamed("/fiabiliteActuel");
                },
                    child: Text("Navigate to fiabilité actuel")),
                ElevatedButton(onPressed: (){
                  Get.toNamed("/fiabilitePasse");
                },
                    child: Text("Navigate to fiabilité passé")),
                ElevatedButton(onPressed: (){
                  Get.toNamed("/mauvaisPilotage");
                },
                    child: Text("Navigate to Mauvais pilotage")),
                ElevatedButton(onPressed: (){
                  Get.toNamed("/ageDuStock");
                },
                    child: Text("Navigate to age du stock")),
                /*ElevatedButton(onPressed: (){
                  Get.toNamed("/tauxOccupation");
                },
                    child: Text("Navigate to Taux d'occupation")),*/
              ],
            ),
          ),*/