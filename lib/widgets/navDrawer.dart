import 'package:flutter/material.dart';
import 'package:get/get.dart';
class navDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Text("Navigation Drawer")),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.6,
            child: ListView(
              children: [
                ListTile(
                  title: Text("fiabilite actuel"),
                  onTap: (){
                    Get.toNamed("/fiabiliteActuel");
                  },
                ),
                ListTile(
                  title: Text("fiabilité Passé"),
                  onTap: (){
                    Get.toNamed("/fiabilitePasse");
                  },
                ),
                ListTile(
                  title: Text("Mauvais Pilotage"),
                  onTap: (){
                    Get.toNamed("/mauvaisPilotage");
                  },
                ),
                ListTile(
                  title: Text("Age du Stock"),
                  onTap: (){
                    Get.toNamed("/ageDuStock");
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
