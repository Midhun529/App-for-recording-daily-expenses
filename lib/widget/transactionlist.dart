import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  TransactionList(this.transactions);
  final List<Transaction> transactions;
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.redAccent, width: 10)),
      height: 300,
      width: MediaQuery.of(context).size.width * 1,
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (context, constraint2) {
                return Column(
                  children: <Widget>[
                    Container(
                      height: constraint2.maxHeight * 0.2,
                      child: Text(
                        'Transaction is Empty',
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    SizedBox(
                      height: constraint2.maxHeight * 0.1,
                    ),
                    Container(
                      height: constraint2.maxHeight * 0.7,
                      child: Image.asset('assets/images/waiting.png',
                          fit: BoxFit.cover),
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
              itemBuilder: (contxt, index) {
                return Card(
                  color: Theme.of(context).accentColor,
                  elevation: 2,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          /*Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.brown,
                                //width: double.infinity,
                              ),
                            ),
                            child: Text(transactions[index].id,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14)),
                          ),*/
                          Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.brown,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              transactions[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.red,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.brown,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              '\$${transactions[index].amount}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.red,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.brown,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              DateFormat.yMMMd()
                                  .format(transactions[index].date),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.red,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: transactions.length),
    );
  }
}
