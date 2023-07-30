import 'package:expense_manager/bar%20graph/bar_graph.dart';
import 'package:expense_manager/data/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:expense_manager/date_converter.dart';

class ExpenseTile extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTime;
  void Function(BuildContext)? deleteTapped;

  ExpenseTile({required this.name, required this.amount, required this.dateTime, required this.deleteTapped});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteTapped,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(4),
          )
        ],
      ),
      child: ListTile(
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
        trailing: Text(
          'Rs.$amount',
          style: TextStyle(
              color: Colors.red,
              fontSize: 20.0
          ),
        )
      ),
    );
  }
}

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfWeek;

  ExpenseSummary({required this.startOfWeek});

  double calculateMax(
      ExpenseData value,
      String sunday,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday
  ){
    double? max = 100;
    List<double> values = [
      value.getDayExpenseSummary()[sunday] ?? 0,
      value.getDayExpenseSummary()[monday] ?? 0,
      value.getDayExpenseSummary()[tuesday] ?? 0,
      value.getDayExpenseSummary()[wednesday] ?? 0,
      value.getDayExpenseSummary()[thursday] ?? 0,
      value.getDayExpenseSummary()[friday] ?? 0,
      value.getDayExpenseSummary()[saturday] ?? 0
    ];
    values.sort();
    max = values.last * 1.1;
    return max == 0 ? 100 : max;
  }

  String calculateTotal(
      ExpenseData value,
      String sunday,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday
  ){
    List<double> values = [
      value.getDayExpenseSummary()[sunday] ?? 0,
      value.getDayExpenseSummary()[monday] ?? 0,
      value.getDayExpenseSummary()[tuesday] ?? 0,
      value.getDayExpenseSummary()[wednesday] ?? 0,
      value.getDayExpenseSummary()[thursday] ?? 0,
      value.getDayExpenseSummary()[friday] ?? 0,
      value.getDayExpenseSummary()[saturday] ?? 0
    ];
    double total = 0;
    for(int i=0;i<values.length;i++){
      total = total + values[i];
    }
    return total.toStringAsFixed(2);
  }

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
      builder: (context, value, child) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text(
                  'Week Total: ',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
                ),
                Text(
                  'Rs.' + calculateTotal(value, sunday, monday, tuesday, wednesday, thursday, friday, saturday),
                  style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: MyBarGraph(
              maxY: calculateMax(value, sunday, monday, tuesday, wednesday, thursday, friday, saturday),
              sunAmount: value.getDayExpenseSummary()[sunday] ?? 0,
              monAmount: value.getDayExpenseSummary()[monday] ?? 0,
              tuesAmount: value.getDayExpenseSummary()[tuesday] ?? 0,
              wedAmount: value.getDayExpenseSummary()[wednesday] ?? 0,
              thursAmount: value.getDayExpenseSummary()[thursday] ?? 0,
              friAmount: value.getDayExpenseSummary()[friday] ?? 0,
              satAmount: value.getDayExpenseSummary()[saturday] ?? 0,
            ),
          ),
        ],
      )
    );
  }
}

