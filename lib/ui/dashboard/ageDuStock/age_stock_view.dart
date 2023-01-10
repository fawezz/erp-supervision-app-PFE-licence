import 'package:application_de_supervision/widgets/agePieChart.dart';
import 'package:application_de_supervision/widgets/navDrawer.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:stacked/stacked.dart';

import 'age_stock_viewFutureModel.dart';

class AgeStockView extends StatelessWidget {
  AgeStockView({Key key}) : super(key: key);

  final TextStyle tStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          drawer: navDrawer(),
          body: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 14, bottom: 14),
                      child: ToggleButtons(
                        children: [
                          Text(
                            "Composant",
                            style: tStyle,
                          ),
                          Text(
                            "Accessoire",
                            style: tStyle,
                          )
                        ],
                        isSelected: model.isSelected,
                        color: Colors.blue[100],
                        selectedColor: Colors.blue,
                        onPressed: (index) {
                          model.updateIsSelected(index);
                        },
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Center(
                      child: model.isSelected[0]
                              ? Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Colors.cyan,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text(
                                          "Composant:",
                                          style: TextStyle(
                                              fontSize: 28,
                                              color: Colors.white),
                                        ),
                                      ),
                                      model.ageDataComposant == null
                                          ? Center(
                                              child: Padding(
                                              padding: const EdgeInsets.all(60),
                                              child:
                                                  CircularProgressIndicator(),
                                            ))
                                          : agePieChart(
                                              ageData: model.ageDataComposant,
                                            )
                                    ],
                                  ),
                                )
                              : Expanded(
                                child: Column(
                                    children: [
                                      Container(
                                        color: Colors.cyan,
                                        width: MediaQuery.of(context).size.width,
                                        child: Text(
                                          "Accessoire:",
                                          style: TextStyle(
                                              fontSize: 28, color: Colors.white),
                                        ),
                                      ),
                                      model.ageDataAccessoire == null
                                          ? Center(
                                              child: Padding(
                                              padding: const EdgeInsets.all(60),
                                              child: CircularProgressIndicator(),
                                            ))
                                          : agePieChart(
                                              ageData: model.ageDataAccessoire,
                                            ),
                                    ],
                                  ),
                              ))
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => AgeStockViewFutureModel(),
    );
  }
}
