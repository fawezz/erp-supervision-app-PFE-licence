import 'package:application_de_supervision/models/critereModel.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:smart_select/smart_select.dart';
import 'package:stacked/stacked.dart';

import 'package:application_de_supervision/ui/startup/startup_viewmodel.dart';

import 'fiabilite_actuel_viewFutureModel.dart';


class FiabiliteActuelView extends StatelessWidget {
   FiabiliteActuelView({Key key}) : super(key: key );



  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) =>
          SafeArea(
            child: Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Selectionner un Critere:", style: TextStyle(fontSize: 20),),
                      model.listClients.isEmpty?
                      Center(
                          child: Padding(
                            padding: const EdgeInsets.all(60),
                            child:
                            CircularProgressIndicator(),
                          )):
                      SmartSelect<int>.single(
                          value: model.selectedIdClient,
                          placeholder: "Selectionner",
                          modalType: S2ModalType.bottomSheet,
                          title: 'Client',
                          choiceItems: model.listClients,
                          onChange: (value){
                            model.setSelectedIdClient(value.value);
                          }),
                      SmartSelect<int>.single(
                          value: model.selectedIdSite,
                          placeholder: "Selectionner",
                          modalType: S2ModalType.bottomSheet,
                          title: 'Site',
                          choiceItems: model.listSites,
                          onChange: (value){
                            model.setSelectedIdSite(value.value);
                          }),
                      model.listProduits.isEmpty?
                      Center(
                          child: Padding(
                            padding: const EdgeInsets.all(60),
                            child:
                            CircularProgressIndicator(),
                          )):
                      SmartSelect<int>.single(
                          value: model.selectedIdProduit,
                          placeholder: "Selectionner",
                          title: 'Produit',
                          choiceItems: model.listProduits,
                          onChange: (value){
                            model.setSelectedIdProduit(value.value);
                          }),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12,right: 20),
                          child: ElevatedButton(
                              child: Text("Afficher"),
                              onPressed: () {
                                  model.postDataActuelle();
                              }
                          ),
                        ),
                      ),
                      model.sommeEnCours==null?Container():
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                        child: Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(24),
                          child: PieChart(animationDuration: Duration(milliseconds: 3000),
                              dataMap: {"En Cours" : model.sommeEnCours, "Non Planifié" : model.sommeNonPlanifie},
                              //colorList: [Colors.lightGreen,Colors.deepOrangeAccent],
                            legendOptions: LegendOptions(
                              showLegendsInRow: true,
                              legendPosition: LegendPosition.top
                            ),
                            colorList: [Colors.lightGreen[200], Colors.blue[100], Colors.purple[100]],
                            chartRadius: MediaQuery.of(context).size.width / 1.65,
                            chartValuesOptions: ChartValuesOptions(
                                showChartValueBackground: true,
                                showChartValues: true,
                                showChartValuesInPercentage: true,
                                showChartValuesOutside: false,
                                decimalPlaces: 2,
                            ),
                              ),
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),
          ),
        viewModelBuilder: () => FiabiliteActuelViewFutureModel(),
    );
  }
}
