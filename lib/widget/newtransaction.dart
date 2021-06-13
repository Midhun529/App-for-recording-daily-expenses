import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;
  NewTransaction(this.addtx);
  @override
  NewTransactionState createState() => NewTransactionState();
}

class NewTransactionState extends State<NewTransaction> {
  final amountController = TextEditingController();
  final nameController = TextEditingController();
  DateTime selectedDate;
  calender() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2018),
            lastDate: DateTime.now())
        .then((date) {
      if (date == null) {
        return;
      } else {
        setState(() {
          return selectedDate = date;
        });
      }
    });
  }

  void submitData() {
    final amount2 = double.parse(amountController.text);
    final name2 = nameController.text;
    if (amount2 <= 0 || name2.isEmpty || selectedDate == null) {
      return;
    }
    widget.addtx(name2, amount2, selectedDate);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(2),
          child: TextField(
            //  onChanged: (val2) {
            //  idinput = val2;
            // },
            keyboardType: TextInputType.number,
            controller: amountController,
            decoration: InputDecoration(labelText: "Enter the amount"),
            onSubmitted: (_) {
              submitData();
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.yellow[50],
              width: 10,
            ),
          ),
          padding: EdgeInsets.all(2),
          child: TextField(
            // onChanged: (val1) {
            // nameinput = val1;
            controller: nameController,
            // },
            decoration:
                InputDecoration(labelText: " Name of the item purchased"),
            onSubmitted: (_) {
              submitData();
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              // ignore: unnecessary_brace_in_string_interps
              "chosen date is :${selectedDate == null ? null : DateFormat.yMMMd().format(selectedDate)}", //DateFormat.yMMMd().format(selectedDate)
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red[900],
              ),
            ),
            FlatButton(
              onPressed: () {
                calender();
              },
              child: Text(
                "Press Here!",
                style: TextStyle(
                  color: Colors.blue[900],
                ),
              ),
            )
          ],
        ),
        FlatButton(
          textColor: Colors.black,
          child: Text("Enter the details"),
          onPressed: submitData,
          color: Colors.redAccent[400],
          padding: EdgeInsets.all(3),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        )
      ],
    );
  }
}
