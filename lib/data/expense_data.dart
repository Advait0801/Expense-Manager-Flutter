import 'package:expense_manager/data/hive_database.dart';
import 'package:expense_manager/models/expense_item.dart';
import 'package:expense_manager/date_converter.dart';
import 'package:flutter/foundation.dart';

class ExpenseData extends ChangeNotifier{
  List<ExpenseItem> expenseList = [];
  final db = HiveDataBase();

  List<ExpenseItem> getExpenseList(){
    return expenseList;
  }

  void prepareData(){
    if(db.read().isNotEmpty){
      expenseList = db.read();
    }
  }

  void addExpense(ExpenseItem newExpenseItem){
    expenseList.add(newExpenseItem);
    notifyListeners();
    db.save(expenseList);
  }

  void removeExpense(ExpenseItem expenseItem){
    expenseList.remove(expenseItem);
    notifyListeners();
    db.save(expenseList);
  }

  String getDayName(DateTime dateTimeObject){
    switch(dateTimeObject.weekday){
      case 1:
        return 'Mon';
      case 2:
        return 'Tues';
      case 3:
        return 'Wed';
      case 4:
        return 'Thurs';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  DateTime getStartWeekDate(){
    DateTime? start;
    DateTime today = DateTime.now();
    for(int i=0;i<7;i++){
      if(getDayName(today.subtract(Duration(days: i))) == 'Sun'){
        start = today.subtract(Duration(days: i));
      }
    }
    return start!;
  }

  Map<String,double> getDayExpenseSummary(){
    Map<String,double> summary = {};
    for(var expense in expenseList){
      String date = getDate(expense.dateTime);
      double amount = double.parse(expense.amount);
      if(summary.containsKey(date)){
        double currentAmount = summary[date]!;
        currentAmount = currentAmount + amount;
        summary[date] = currentAmount;
      }
      else{
        summary.addAll({date:amount});
      }
    }
    return summary;
  }
}