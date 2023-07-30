import 'dart:math';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:expense_manager/models/expense_item.dart';

class HiveDataBase{
  final _myBox = Hive.box("expense_database");

  void save(List<ExpenseItem> allExpenses){
    List<List<dynamic>> allExpensesFormatted = [];

    for(var expense in allExpenses){
      List<dynamic> expensesFormatted = [
        expense.name,
        expense.amount,
        expense.dateTime
      ];
      allExpensesFormatted.add(expensesFormatted);
    }
    _myBox.put("All_Expenses", allExpensesFormatted);
  }

  List<ExpenseItem> read(){
    List savedExpenses = _myBox.get("All_Expenses") ?? [];
    List<ExpenseItem> allExpenses = [];
    for(int i=0;i<savedExpenses.length;i++){
      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];
      DateTime dateTime = savedExpenses[i][2];

      allExpenses.add(ExpenseItem(name: name, amount: amount, dateTime: dateTime));
    }
    return allExpenses;
  }
}