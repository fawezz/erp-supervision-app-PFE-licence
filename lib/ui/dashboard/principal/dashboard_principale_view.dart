
import 'package:application_de_supervision/app/designConstants.dart';
import 'package:application_de_supervision/ui/dashboard/ageDuStock/age_stock_view.dart';
import 'package:application_de_supervision/ui/dashboard/fiabiliteActuel/fiabilite_actuel_view.dart';
import 'package:application_de_supervision/ui/dashboard/fiabilitePasse/fiabilite_passe_view.dart';
import 'package:application_de_supervision/ui/dashboard/mauvaisPilotage/mauvais_pilotage_view.dart';
import 'package:application_de_supervision/ui/dashboard/variationMauvaisPilotage/variation_mauvais_pilotage_view.dart';
import 'package:application_de_supervision/widgets/agePieChart.dart';
import 'package:application_de_supervision/widgets/navDrawer.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_principale_viewFutureModel.dart';


class DashboardPrincipaleView extends StatelessWidget {
   DashboardPrincipaleView({Key key}) : super(key: key );



  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) =>DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text("Dashboard", style: TextStyle(color: Colors.black)),
            actions: [
              Padding(padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Icon(Icons.logout, size: 28,),
                  onTap: () async {
                    if (await confirm(
                      context,
                      title: Text('Confirmation'),
                      content: Text('Voulez vous vraiment quitter ?'),
                      textOK: Text('Oui'),
                      textCancel: Text('Non'),
                    ))
                      model.deconnecter();
                  },
                ),
              )
            ],
            elevation: 0,
            backgroundColor: Colors.white,
            flexibleSpace: Container(
              color: appBarColor,
              /*decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Colors.green[300],
                        Colors.blue
                      ])
              ),*/),
              bottom: TabBar(
              //labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.white,
              indicator: BoxDecoration(
                //color: Colors.transparent,
                //color: HexColor("#1EE196"),
                color:   HexColor("#2a8dab"),
                //gradient: LinearGradient(
                    //colors: [Colors.cyan, Colors.cyan]),
                borderRadius: BorderRadius.circular(40),
              ),

              tabs: [
                Tab(child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("Variation Pilotage", style: TextStyle(fontSize: 16),),)),
                Tab(child: Text("Mauvais Pilotage",style: TextStyle(fontSize: 16))),
                Tab(child: Text("Fiabilité",style: TextStyle(fontSize: 16))),
                Tab(child: Text("Age Stock",style: TextStyle(fontSize: 16)))

              ],),
          ),
          body: SizedBox(
            //height: MediaQuery.of(context).size.height,
            child: TabBarView(
              children: [
                VariationPilotageView(),
                MauvaisPilotageView(),
                FiabilitePasseView(),
                AgeStockView(),

              ],
            ),
          ),

            ),
          ),
      ),
        viewModelBuilder: () => DashboardPrincipaleViewModel(),
    );
  }
}

