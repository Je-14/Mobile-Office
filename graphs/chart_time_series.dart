import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

/// Data class to visualize.
class _SalesData {
  final int year;
  final int sales;

  _SalesData(this.year, this.sales);
  // Returns Jan.1st of that year as date.
  DateTime get date => DateTime(year);
}

/// Generate some random data.
List<_SalesData> _genRandData() {
  final random = Random();
  // Returns an increasing series with some fluctuations.
  return [
    for (int i = 2015; i < 2022; ++i)
      _SalesData(i, (i - 2010) * 40 + random.nextInt(100)),
  ];
}

class TimeseriesChartExample extends StatefulWidget {
  const TimeseriesChartExample({Key? key}) : super(key: key);

  @override
  _TimeseriesChartExampleState createState() => _TimeseriesChartExampleState();
}

class _TimeseriesChartExampleState extends State<TimeseriesChartExample> {
  // Chart configs.
  final bool _animate = true;
  final bool _defaultInteractions = true;
  final bool _includeArea = true;
  final bool _includePoints = true;
  final bool _stacked = true;
  final charts.BehaviorPosition _titlePosition = charts.BehaviorPosition.bottom;
  final charts.BehaviorPosition _legendPosition =
      charts.BehaviorPosition.bottom;

  // Data to render.
  late List<_SalesData> _series1, _series2;

  @override
  void initState() {
    super.initState();
    _series1 = _genRandData();
    _series2 = _genRandData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        SizedBox(
          height: 400,
          child: charts.TimeSeriesChart(
            /*seriesList=*/ [
              charts.Series<_SalesData, DateTime>(
                id: 'Sales-1',
                colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
                domainFn: (_SalesData sales, _) => sales.date,
                measureFn: (_SalesData sales, _) => sales.sales,
                data: _series1,
              ),
              charts.Series<_SalesData, DateTime>(
                id: 'Sales-2',
                colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
                domainFn: (_SalesData sales, _) => sales.date,
                measureFn: (_SalesData sales, _) => sales.sales,
                data: _series2,
              ),
            ],
            defaultInteractions: _defaultInteractions,
            defaultRenderer: charts.LineRendererConfig(
              includePoints: _includePoints,
              includeArea: _includeArea,
              stacked: _stacked,
            ),
            animate: _animate,
            behaviors: [
              // Add title.
              charts.ChartTitle(
                'sales time series',
                behaviorPosition: _titlePosition,
              ),
              // Add legend.
              charts.SeriesLegend(position: _legendPosition),
              // Highlight X and Y value of selected point.
              charts.LinePointHighlighter(
                showHorizontalFollowLine:
                    charts.LinePointHighlighterFollowLineType.all,
                showVerticalFollowLine:
                    charts.LinePointHighlighterFollowLineType.nearest,
              ),
            ],
          ),
        ),
        //const Divider(),
        //..._controlWidgets(),
      ],
    );
  }

  /// Widgets to control the chart appearance and behavior.
//   List<Widget> _controlWidgets() => <Widget>[
//         SwitchListTile(
//           title: const Text('animate'),
//           onChanged: (bool val) => setState(() => this._animate = val),
//           value: this._animate,
//         ),
//         SwitchListTile(
//           title: const Text('defaultInteractions'),
//           onChanged: (bool val) =>
//               setState(() => this._defaultInteractions = val),
//           value: this._defaultInteractions,
//         ),
//         SwitchListTile(
//           title: const Text('includePoints'),
//           onChanged: (bool val) => setState(() => this._includePoints = val),
//           value: this._includePoints,
//         ),
//         SwitchListTile(
//           title: const Text('includeArea'),
//           onChanged: (bool val) => setState(() => this._includeArea = val),
//           value: this._includeArea,
//         ),
//         SwitchListTile(
//           title: const Text('stacked'),
//           onChanged: (bool val) => setState(() => this._stacked = val),
//           value: this._stacked,
//         ),
//         ListTile(
//           title: const Text('titlePosition:'),
//           trailing: DropdownButton<charts.BehaviorPosition>(
//             value: this._titlePosition,
//             onChanged: (charts.BehaviorPosition? newVal) {
//               if (newVal != null) {
//                 setState(() => this._titlePosition = newVal);
//               }
//             },
//             items: [
//               for (final val in charts.BehaviorPosition.values)
//                 DropdownMenuItem(value: val, child: Text('$val'))
//             ],
//           ),
//         ),
//         ListTile(
//           title: const Text('legendPosition:'),
//           trailing: DropdownButton<charts.BehaviorPosition>(
//             value: this._legendPosition,
//             onChanged: (charts.BehaviorPosition? newVal) {
//               if (newVal != null) {
//                 setState(() => this._legendPosition = newVal);
//               }
//             },
//             items: [
//               for (final val in charts.BehaviorPosition.values)
//                 DropdownMenuItem(value: val, child: Text('$val'))
//             ],
//           ),
//         ),
//       ];
}
