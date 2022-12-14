
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';


class TransactionList extends StatelessWidget {

  List transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder:((context, index) {
         dynamic tr = transactions[index];
          return Card(
                      child: Row(children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "R \$ ${tr.value.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                             color: Theme.of(context).primaryColor,),
                        )),
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(
                        tr.title.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        DateFormat('d/MM/yyyy').format(tr.date),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ]),
                  ]));
        }),
      ),
    );
  }
}