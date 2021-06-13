import 'package:flutter/material.dart';
import 'package:dailyexpense/widget/chartbar.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(
    this.recentTransactions,
  );

  List<Map<String, Object>> get finaltransactiondetails {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(
          days: index,
        ),
      );

      var totalMoney = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalMoney += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).toString(),
        'money': totalMoney,
      };
    });
  }

  double get totalSpending {
    return finaltransactiondetails.fold(0.0, (sum, item) {
      return sum + item['money'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: Card(
        elevation: 3,
        child: Row(
          children: finaltransactiondetails.map((ft) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                ft['money'],
                ft['day'],
                totalSpending == 0.0
                    ? 0.0
                    : (ft['money'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
