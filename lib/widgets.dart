import 'package:expense_manager/bar%20graph/bar_graph.dart';
import 'package:expense_manager/data/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expense_manager/date_converter.dart';

class ExpenseTile extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTime;

  ExpenseTile({required this.name, required this.amount, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
      ),
      subtitle: Text(
          '${dateTime.day}/${dateTime.month}/${dateTime.year}',
          style: TextStyle(
              color: Colors.black,
              fontSize: 16.0
          )
      ),
      trailing: amount[0]=='-' ? Text(
        '- Rs.${amount.substring(1,amount.length)}',
        style: TextStyle(
          color: Colors.red,
          fontSize: 20.0
        )
      ) : Text(
        '+ Rs.$amount',
        style: TextStyle(
          color: Colors.green,
          fontSize: 20.0
        ),
      )
    );
  }
}

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfWeek;

  ExpenseSummary({required this.startOfWeek});

  @override
  Widget build(BuildContext context) {
    String sunday = getDate(startOfWeek.add(const Duration(days: 0)));
    String monday = getDate(startOfWeek.add(const Duration(days: 1)));
    String tuesday = getDate(startOfWeek.add(const Duration(days: 2)));
    String wednesday = getDate(startOfWeek.add(const Duration(days: 3)));
    String thursday = getDate(startOfWeek.add(const Duration(days: 4)));
    String friday = getDate(startOfWeek.add(const Duration(days: 5)));
    String saturday = getDate(startOfWeek.add(const Duration(days: 6)));

    return Consumer<ExpenseData>(
      builder: (context, value, child) => SizedBox(
        height: 300,
        child: MyBarGraph(
          maxY: 200,
          sunAmount: value.getDayExpenseSummary()[sunday] ?? 0,
          monAmount: value.getDayExpenseSummary()[monday] ?? 0,
          tuesAmount: value.getDayExpenseSummary()[tuesday] ?? 0,
          wedAmount: value.getDayExpenseSummary()[wednesday] ?? 0,
          thursAmount: value.getDayExpenseSummary()[thursday] ?? 0,
          friAmount: value.getDayExpenseSummary()[friday] ?? 0,
          satAmount: value.getDayExpenseSummary()[saturday] ?? 0,
        ),
      )
    );
  }
}

