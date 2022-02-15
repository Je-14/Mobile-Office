import 'package:flutter/material.dart';

class Receipts extends StatelessWidget {
  const Receipts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Receipts'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Cash",
              ),
              Tab(
                text: 'Invoice',
              ),
              Tab(
                text: 'Proforma',
              ),
              Tab(
                text: 'General Receipt',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Cash(),
            Invoice(),
            Proforma(),
            GeneralReceipt(),
          ],
        ),
      ),
    );
  }
}

class Cash extends StatefulWidget {
  const Cash({Key? key}) : super(key: key);

  @override
  _CashState createState() => _CashState();
}

class _CashState extends State<Cash> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Invoice extends StatefulWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Proforma extends StatefulWidget {
  const Proforma({Key? key}) : super(key: key);

  @override
  _ProformaState createState() => _ProformaState();
}

class _ProformaState extends State<Proforma> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class GeneralReceipt extends StatefulWidget {
  const GeneralReceipt({Key? key}) : super(key: key);

  @override
  _GeneralReceiptState createState() => _GeneralReceiptState();
}

class _GeneralReceiptState extends State<GeneralReceipt> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
