import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {

 final void Function(String,double) inserirDados;

  TransactionForm(this.inserirDados);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
 final  titleController = TextEditingController();

 final  valueController = TextEditingController();

 void teste () {
  final value = double.tryParse(valueController.text) ?? 0.0;
  final title = titleController.text;
                        if (title.isEmpty || value <= 0) {
                          return ;
                        }
                        widget.inserirDados(title,value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
              child: Container(padding: EdgeInsets.all(10),
                child: Column(children: [
                  TextField(controller: titleController,decoration: InputDecoration(labelText: 'Titulo')),
                  TextField(keyboardType:TextInputType.numberWithOptions(decimal: true),onSubmitted: (_) => teste() ,controller: valueController,decoration: InputDecoration(labelText: 'Valor (R\$)')),
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: teste,
                         child: Text('Inserir Gasto',style:TextStyle(color: Theme.of(context).primaryColor,))),
                    ],
                  )
                ]),
              ),
            );
  }
}