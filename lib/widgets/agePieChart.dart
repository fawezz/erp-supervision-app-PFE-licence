import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
class agePieChart extends StatelessWidget {

  var ageData;

  agePieChart({@required this.ageData,});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      animationDuration: Duration(milliseconds: 3000),
      dataMap: {ageData[0]["interval"]: ageData[0]["pourcentage"],
        ageData[1]["interval"]: ageData[1]["pourcentage"],
        ageData[2]["interval"]: ageData[2]["pourcentage"]},
      legendOptions: LegendOptions(legendPosition: LegendPosition.top,
          showLegendsInRow: true,
          legendTextStyle: TextStyle(fontSize: 18)),
      colorList: [Colors.lightGreen[200], Colors.blue[100], Colors.purple[100]],
      chartRadius: MediaQuery
          .of(context)
          .size
          .width / 1.5,
      chartValuesOptions: ChartValuesOptions(
        chartValueStyle: TextStyle(fontSize: 22, color: Colors.black),
        showChartValueBackground: false,
        showChartValues: true,
        showChartValuesInPercentage: true,
        showChartValuesOutside: false,
        decimalPlaces: 2,
      ),
    );
  }
}