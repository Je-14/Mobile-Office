import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final CollectionReference _firebaseFirestore =
      FirebaseFirestore.instance.collection("cash");
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.close),
      ),
      const SizedBox(
        width: 10,
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firebaseFirestore.snapshots().asBroadcastStream(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView(
            children: [
              ...snapshot.data!.docs
                  .where((QueryDocumentSnapshot<Object?> element) =>
                      element['item']
                          .toString()
                          .toLowerCase()
                          .contains(query.toLowerCase()))
                  .map(
                ((QueryDocumentSnapshot<Object?> data) {
                  final String qty = data.get('qty');
                  final String title = data.get('item');
                  final String price = data.get('price');

                  return ListTile(
                    leading: Text(qty),
                    title: Text(title),
                    subtitle: Text(price),
                  );
                }),
              ),
            ],
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firebaseFirestore.snapshots().asBroadcastStream(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("Your query did not match anything"),
            );
          } else {
            return ListView(
              children: [
                ...snapshot.data!.docs
                    .where((QueryDocumentSnapshot<Object?> element) =>
                        element['item']
                            .toString()
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                    .map(((QueryDocumentSnapshot<Object?> data) {
                  final String qty = data.get('qty');
                  final String title = data.get('item');
                  final String price = data.get('price');

                  return ListTile(
                    leading: const Icon(Icons.receipt),
                    title: Text(title),
                    subtitle: Text(
                        "Quantity: " + qty + "      " + " Price: " + price),
                  );
                }))
              ],
            );
          }
        }
      },
    );
  }
}

class SearchCredit extends SearchDelegate {
  final CollectionReference _firebaseFirestore =
      FirebaseFirestore.instance.collection("credit");
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.close),
      ),
      const SizedBox(
        width: 10,
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firebaseFirestore.snapshots().asBroadcastStream(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView(
            children: [
              ...snapshot.data!.docs
                  .where((QueryDocumentSnapshot<Object?> element) =>
                      element['item']
                          .toString()
                          .toLowerCase()
                          .contains(query.toLowerCase()))
                  .map(((QueryDocumentSnapshot<Object?> data) {
                final String qty = data.get('qty');
                final String title = data.get('item');
                final String price = data.get('price');

                return ListTile(
                  leading: const Icon(Icons.receipt),
                  title: Text(title),
                  subtitle:
                      Text("Quantity: " + qty + "      " + " Price: " + price),
                );
              }))
            ],
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firebaseFirestore.snapshots().asBroadcastStream(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: LinearProgressIndicator(),
          );
        } else {
          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("Your query did not match anything"),
            );
          } else {
            return ListView(
              children: [
                ...snapshot.data!.docs
                    .map(((QueryDocumentSnapshot<Object?> data) {
                  final String qty = data.get('qty');
                  final String title = data.get('item');
                  final String price = data.get('price');

                  return ListTile(
                    leading: const Icon(Icons.receipt),
                    title: Text(title),
                    subtitle: Text(
                        "Quantity: " + qty + "      " + " Price: " + price),
                  );
                }))
              ],
            );
          }
        }
      },
    );
  }
}
