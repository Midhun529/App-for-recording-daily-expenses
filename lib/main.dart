import 'package:flutter/material.dart';
import 'package:dailyexpense/widget/transactionlist.dart';
import './widget/Newtransaction.dart';
import './model/transaction.dart';
import './widget/chart.dart';
//import 'package:flutter/services.dart';

void main() {
  //SystemChrome.setPreferredOrientations(
  //[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ShowExpenses",
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.orange,
        /* fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
                // ignore: deprecated_member_use
                title: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 30,
            )),*/
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  /*String idinput;
  String nameinput;*/
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  startingAddNewTransaction(BuildContext cxt) {
    showModalBottomSheet(
      context: cxt,
      builder: (_) {
        return GestureDetector(
            child: NewTransaction(addNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque);
      },
      backgroundColor: Theme.of(context).primaryColorLight,
    );
  }

  final List<Transaction> userTransactions = [
    /*Transaction(id: "a1", name: "midhun", amount: 30.6, date: DateTime.now()),
    Transaction(id: "a2", name: "Mathews", amount: 20.1, date: DateTime.now())*/
  ];
  addNewTransaction(String name1, double amount1, DateTime chosenDate) {
    final newtx = Transaction(
      id: DateTime.now().toString(),
      name: name1,
      amount: amount1,
      date: chosenDate,
    );
    setState(() {
      userTransactions.add(newtx);
    });
  }

  List<Transaction> get _recentTransactions {
    return userTransactions.where((ts) {
      return ts.date.isAfter(
        DateTime.now().subtract(
          Duration(
            days: 7,
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            startingAddNewTransaction(context);
          },
        ),
      ],
      title: Text("Transaction Record"),
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.6,
              child: Chart(
                _recentTransactions,
              ),
            ),
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.4,
              child: TransactionList(userTransactions),
            ),
            //for text field
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          startingAddNewTransaction(context);
        },
      ),
    );
  }
}
