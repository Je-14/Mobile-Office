import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Statistics'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Doughnut Graph",
              ),
              Tab(
                text: 'BarGraph',
              ),
              Tab(
                text: 'LineGraph',
              ),
              Tab(
                text: 'Scatter Graph',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Doughnut(),
            BarGraph(),
            LineGraph(),
            ScatterGraph(),
          ],
        ),
      ),
    );
  }
}

class Doughnut extends StatefulWidget {
  const Doughnut({Key? key}) : super(key: key);

  @override
  _DoughnutState createState() => _DoughnutState();
}

class _DoughnutState extends State<Doughnut> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BarGraph extends StatefulWidget {
  const BarGraph({Key? key}) : super(key: key);

  @override
  _BarGraphState createState() => _BarGraphState();
}

class _BarGraphState extends State<BarGraph> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LineGraph extends StatefulWidget {
  const LineGraph({Key? key}) : super(key: key);

  @override
  _LineGraphState createState() => _LineGraphState();
}

class _LineGraphState extends State<LineGraph> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ScatterGraph extends StatefulWidget {
  const ScatterGraph({Key? key}) : super(key: key);

  @override
  _ScatterGraphState createState() => _ScatterGraphState();
}

class _ScatterGraphState extends State<ScatterGraph> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
