import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transcation_item.dart';

class TranscationList extends StatelessWidget {
  final List<Transaction> transactions;
  Function deleteTx;

  TranscationList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                const Text('no expenses yet'),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/sleep.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TranscationItem(
                transaction: transactions[index],
                deleteTx: deleteTx,
              );
            },
            itemCount: transactions.length,
          );
  }
}
