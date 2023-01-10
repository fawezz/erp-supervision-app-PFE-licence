import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
class BarChartPilotage extends StatelessWidget {
  final List<charts.Series<dynamic, String>> data;
  final String title;
  BarChartPilotage(this.data ,{@required String title}) : this.title = title;
  /// Creates a [BarChart] with sample data and no transition.
  /*factory BarChartPilotage.withSampleData() {
    return BarChartPilotage(
      _createSampleData(),
      // Disable animations for image tests.
    );
  }*/
  @override
  Widget build(BuildContext context) {
    /*List<Series<int,String>> series
    = [Series(
        id: "this is id",
        data: data
    )];*/
    return Container(
      height: MediaQuery.of(context).size.height*0.5,
      //padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50)
      ),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(title,style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: charts.BarChart(
                  data,
                  animate: true,
                  barRendererDecorator: charts.BarLabelDecorator(),
                  //primaryMeasureAxis: AxisSpec(renderSpec: RenderSpec.,showAxisLine: true),
                  // Set a bar label decorator.
                  // Example configuring different styles for inside/outside:
                  //       barRendererDecorator: new charts.BarLabelDecorator(
                  //          insideLabelStyleSpec: TextStyleSpec(...),
                  //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
                  //          barRendererDecorator: BarLabelDecorator<String>(),
                  //         domainAxis: OrdinalAxisSpec(showAxisLine: false),
                        ),
              ),
            ],
          ),
        )),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
      new OrdinalSales('2017', 90),
      new OrdinalSales('2017', 20),
      new OrdinalSales('2017', 180),
      new OrdinalSales('2017', 75),
    ];

    return [
      charts.Series<OrdinalSales, String>(
          id: 'Sales',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: data,
          // Set a label accessor to control the text of the bar label.
          labelAccessorFn: (OrdinalSales sales, _) =>
          '\$${sales.sales.toString()}')
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

