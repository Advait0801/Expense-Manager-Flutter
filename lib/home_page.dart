import 'package:expense_manager/data/expense_data.dart';
import 'package:expense_manager/models/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textNameController = TextEditingController();
  final textAmountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<ExpenseData>(context, listen: false).prepareData();
  }

  void addExpenditure(){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Enter Expense Details',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: textNameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Enter expense name',
              ),

            ),
            TextField(
              controller: textAmountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter expense amount',
              ),
            )
          ],
        ),
        actions: [
          MaterialButton(
            child: Text(
              'Add Expense',
              style: TextStyle(
                  fontSize: 18.0
              ),
            ),
            onPressed: (){save();}
          )
        ],
      )
    );
  }

  void delete(ExpenseItem expenseItem){
    Provider.of<ExpenseData>(context, listen: false).removeExpense(expenseItem);
  }

  void save(){
    if(textAmountController.text.isNotEmpty && textNameController.text.isNotEmpty){
      ExpenseItem newItem = ExpenseItem(
          name: textNameController.text,
          amount: textAmountController.text,
          dateTime: DateTime.now()
      );
      Provider.of<ExpenseData>(context, listen: false).addExpense(newItem);
    }
    Navigator.pop(context);
    textNameController.clear();
    textAmountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
            child: Text(
              'Expense Manager',
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 40.0,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue[900],
        onPressed: addExpenditure,
      ),
      body: Consumer<ExpenseData>(
        builder: (context , expenseData , child) {
          return ListView(
            children: [
              ExpenseSummary(startOfWeek: expenseData.getStartWeekDate()),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: expenseData.getExpenseList().length,
                itemBuilder: (context, index) {
                  return ExpenseTile(
                    name: expenseData.getExpenseList()[index].name,
                    amount: expenseData.getExpenseList()[index].amount,
                    dateTime: expenseData.getExpenseList()[index].dateTime,
                    deleteTapped: (p0) => delete(expenseData.getExpenseList()[index]),
                  );
                },
              )
            ],
          );
        },
      )
    );
  }
}
