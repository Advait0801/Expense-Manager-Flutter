import 'package:flutter/material.dart';

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
  const ExpenseSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

