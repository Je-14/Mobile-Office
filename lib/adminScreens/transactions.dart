import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class GetTransaction extends StatelessWidget {
  final String docId;

  const GetTransaction(this.docId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference cashTransactions =
        FirebaseFirestore.instance.collection('cash');

    return FutureBuilder<DocumentSnapshot>(
      future: cashTransactions.doc(docId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text(
            "Something went wrong",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
              color: Colors.grey,
            ),
          );
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Center(
            child: Text(
              "Document does not exist",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                color: Colors.grey,
              ),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(30),
              child: DataTable2(
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  minWidth: 350,
                  columns: const [
                    DataColumn2(
                      label: Text('Quantity'),
                      size: ColumnSize.L,
                    ),
                    DataColumn(
                      label: Text('Item'),
                    ),
                    DataColumn(
                      label: Text('Price'),
                    ),
                  ],
                  rows: List<DataRow>.generate(
                      1,
                      (index) => DataRow(cells: [
                            DataCell(
                              Text(
                                "${data['qty']}",
                                style: const TextStyle(
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                "${data['item']}",
                                style: const TextStyle(
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                "${data['price']}",
                                style: const TextStyle(
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ]))),
            ),
          );
        }

        return const SizedBox(
          height: 10,
          width: 10,
          child: CircularProgressIndicator(
            color: Colors.grey,
            strokeWidth: 4.0,
          ),
        );
      },
    );
  }
}
