import 'package:application_de_supervision/ui/dashboard/variationMauvaisPilotage/variation_mauvais_pilotage_viewFutureModel.dart';
import 'package:application_de_supervision/widgets/barChartPilotage.dart';
import 'package:application_de_supervision/widgets/shadowedContainer.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:stacked/stacked.dart';

class VariationPilotageView extends StatelessWidget {
  VariationPilotageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle tStyle = TextStyle(fontSize: 16);
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 14, bottom: 14),
                  child: ToggleButtons(
                    children: [
                      Text(
                        "Semaine",
                        style: tStyle,
                      ),
                      Text(
                        "Mois",
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
                        child: BarChartPilotage(
                          [
                            charts.Series<DummyData, String>(
                                fillColorFn: (_, __) =>
                    charts.MaterialPalette.cyan.shadeDefault.darker,
                                id: 'dummy',
                                domainFn: (DummyData pilotage, _) =>
                                    pilotage.labell,
                                measureFn: (DummyData pilotage, _) =>
                                    pilotage.mauvaisPilotage,
                                data: model.dummyDataSemaine,
                                labelAccessorFn: (DummyData pilotage, _) =>
                                    '${pilotage.mauvaisPilotage.toString()}'),
                          ],
                          title: "Mauvais Pilotage Par Semaine",
                        ),
                      )
                    : Expanded(
                        child: BarChartPilotage(
                          [
                            charts.Series<DummyData, String>(
                              fillColorFn: (_, __) =>
                              charts.MaterialPalette.cyan.shadeDefault.darker,
                              id: 'dummy',
                              domainFn: (DummyData pilotage, _) =>
                                  pilotage.labell,
                              measureFn: (DummyData pilotage, _) =>
                                  pilotage.mauvaisPilotage,
                              data: model.dummyDataMois,
                              labelAccessorFn: (DummyData pilotage, _) =>
                                  '${pilotage.mauvaisPilotage.toString()}',
                              //measureFormatterFn:
                            ),
                          ],
                          title: "Mauvais Pilotage Par Mois",
                        ),
                      ),
              ),
            ]),
          ),
        ),
      ),
      viewModelBuilder: () => VariationPilotageViewFutureModel(),
    );
  }
}
