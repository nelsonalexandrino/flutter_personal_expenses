import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'You dont have transactions',
                  style: Theme.of(context).textTheme.headline,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView(
            children: transactions
                .map((transaction) => TransactionItem(
                    key: ValueKey(transaction.id),
                    transaction: transaction,
                    deleteTransaction: deleteTransaction))
                .toList());
  }
}
