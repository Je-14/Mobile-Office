import 'package:flutter/material.dart';
import 'package:mobile_office/screens/view_collections.dart';

class CashTransactions extends StatelessWidget {
  const CashTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              onTap: () => showSearch(
                context: context,
                delegate: Search(),
              ),
              leading: const Icon(Icons.money),
              title: const Text('Cash Transactions'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: SearchCredit(),
                );
              },
              leading: const Icon(Icons.credit_card_off),
              title: const Text('Credit Transactions'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
