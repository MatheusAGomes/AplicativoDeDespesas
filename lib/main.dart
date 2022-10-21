import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'components/transaction_list.dart';
import 'components/transaction_form.dart';
import 'dart:math';
import '../models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ThemeData TEMA = ThemeData();
    return MaterialApp(home: MyHomePage(),theme:ThemeData(
      primarySwatch: Colors.amber
    ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List transactions = [
    Transaction(
        id: '0', title: 'Par de tenis', value: 2000, date: DateTime.now()),
    Transaction(
        id: '1',
        title: 'Manutenção do carro',
        value: 5000,
        date: DateTime.now()),
  ];
  addTransactions(String title, double value) {
    setState(() {
      transactions.add(new Transaction(
          id: transactions.length.toString(),
          title: title,
          value: value,
          date: DateTime.now()));
    });
    Navigator.of(context).pop();
  }

  openTrasactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(addTransactions);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expensives'),
        actions: [IconButton(onPressed: ()=>openTrasactionFormModal(context), icon: Icon(Icons.add))],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                child: Card(
              child: Text('Grafico', style: TextStyle(color: Colors.white)),
              color: Theme.of(context).primaryColor,
            )),
            TransactionList(transactions)
            
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: ()=> openTrasactionFormModal(context), child: Icon(Icons.add)),
    );
  }
}
