import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Transactions'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Cash",
              ),
              Tab(
                text: 'Credit',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Cash(),
            Credit(),
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
  CollectionReference cash = FirebaseFirestore.instance.collection('cash');

  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late String qty;
  late String item;
  late String price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _quantityController,
                      decoration: const InputDecoration(labelText: 'Quantity'),
                      validator: (text) =>
                          text!.isEmpty || !RegExp(r'^[ 0-9]+$').hasMatch(text)
                              ? 'Enter Quantity '
                              : null,
                      onChanged: (value) {
                        qty = value;
                      },
                    ),
                    TextFormField(
                      controller: _priceController,
                      decoration: const InputDecoration(labelText: 'Item'),
                      validator: (text) => text!.isEmpty ||
                              !RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(text)
                          ? 'Enter Item. '
                          : null,
                      onChanged: (value) {
                        item = value;
                      },
                    ),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Price'),
                      validator: (text) =>
                          text!.isEmpty || !RegExp(r'^[ 0-9]+$').hasMatch(text)
                              ? 'Enter Price '
                              : null,
                      onChanged: (value) {
                        price = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          child: IconButton(
                            onPressed: () async {
                              await cash.add(
                                {'qty': qty, 'item': item, 'price': price},
                              );
                              setState(() {});
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Data Saved"),
                                ),
                              );
                            },
                            icon: const Icon(Icons.arrow_forward),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Credit extends StatefulWidget {
  const Credit({Key? key}) : super(key: key);

  @override
  _CreditState createState() => _CreditState();
}

class _CreditState extends State<Credit> {
  CollectionReference credit = FirebaseFirestore.instance.collection('credit');

  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late String qty;
  late String item;
  late String price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _quantityController,
                      decoration: const InputDecoration(labelText: 'Quantity'),
                      validator: (text) =>
                          text!.isEmpty || !RegExp(r'^[ 0-9]+$').hasMatch(text)
                              ? 'Enter Quantity '
                              : null,
                      onChanged: (value) {
                        qty = value;
                      },
                    ),
                    TextFormField(
                      controller: _priceController,
                      decoration: const InputDecoration(labelText: 'Item'),
                      validator: (text) => text!.isEmpty ||
                              !RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(text)
                          ? 'Enter Item. '
                          : null,
                      onChanged: (value) {
                        item = value;
                      },
                    ),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Price'),
                      validator: (text) =>
                          text!.isEmpty || !RegExp(r'^[ 0-9]+$').hasMatch(text)
                              ? 'Enter Price '
                              : null,
                      onChanged: (value) {
                        price = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          child: IconButton(
                            onPressed: () async {
                              await credit.add(
                                {'qty': qty, 'item': item, 'price': price},
                              );
                              setState(() {});
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Data Saved"),
                                ),
                              );
                            },
                            icon: const Icon(Icons.arrow_forward),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
