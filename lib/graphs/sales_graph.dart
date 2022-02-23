// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'sales.dart';

// class SalesGraph extends StatefulWidget {
//   const SalesGraph({Key? key}) : super(key: key);

//   @override
//   _SalesGraphState createState() => _SalesGraphState();
// }

// class _SalesGraphState extends State<SalesGraph> {
//   late List<charts.Series<Sales, String>> _seriesBarData;
//   late List<Sales> myData;

//   _generateData(myData) {
//     _seriesBarData.add(
//       charts.Series(
//         domainFn: (Sales sales, _) => sales.item.toString(),
//         measureFn: (Sales sales, _) => sales.qty,
//         colorFn: null,
//         id: 'Sales',
//         data: myData,
//         labelAccessorFn: (Sales row, _) => "${row.item}",
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _buildBody(context),
//     );
//   }

//   Widget _buildBody(context) {
//     return StreamBuilder(
//       stream: FirebaseFirestore.instance.collection('cash').snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
//         if (!snapshot.hasData) {
//           return const CircularProgressIndicator();
//         } else {
//           List<Sales> sales = snapshot.data!.documents
//               .map((DocumentSnapshot) => Sales.fromMap(DocumentSnapshot.data))
//               .toList();
//           return _buildChart(context, sales);
//         }
//       },
//     );
//   }
// }
