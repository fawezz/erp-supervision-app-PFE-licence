
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:stacked/stacked.dart';

import 'taux_occupation_viewFutureModel.dart';


class TauxOccupationView extends StatelessWidget {
   TauxOccupationView({Key key}) : super(key: key );



  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) =>
          SafeArea(
            child: Scaffold(
              appBar: AppBar(title: Text("Taux d'occupation"),),
              body: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Produit:", style: TextStyle(fontSize: 20),),
                    Center(
                      //child: Text(model.test.toString())
                    ),
                    /*model.sommeEnCours==null?Container():
                    PieChart(animationDuration: Duration(milliseconds: 3000),
                        dataMap: {"En Cours" : model.sommeEnCours, "Mauvais pilotage" : model.sommeMauvaisPilotage},
                        //colorList: [Colors.lightGreen,Colors.deepOrangeAccent],
                      chartRadius: MediaQuery.of(context).size.width / 1.2,
                      chartValuesOptions: ChartValuesOptions(
                          showChartValueBackground: true,
                          showChartValues: true,
                          showChartValuesInPercentage: true,
                          showChartValuesOutside: false,
                          decimalPlaces: 2,
                      ),
                        )
*/
                  ],
                ),
              ),
            ),
          ),
        viewModelBuilder: () => TauxOccupationViewFutureModel(),
    );
  }
}
