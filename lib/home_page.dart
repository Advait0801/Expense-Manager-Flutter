import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textNameController = TextEditingController();
  final textAmountController = TextEditingController();

  void addExpense(){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Income or Expense?',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: addIncome,
            child: Text(
              'Add Income',
              style: TextStyle(
                fontSize: 18.0
              ),
            ),

          ),
          MaterialButton(
            onPressed: addExpenditure,
            child: Text(
              'Add Expense',
              style: TextStyle(
                  fontSize: 18.0
              ),
            ),
          )
        ],
      ),

    );
  }

  void addExpenditure(){
    Navigator.pop(context);
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
              decoration: InputDecoration(
                hintText: 'Enter expense name',
              ),

            ),
            TextField(
              controller: textAmountController,
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
            onPressed: (){save(true);}
          )
        ],
      )
    );
  }

  void addIncome(){
    Navigator.pop(context);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Enter Income Details',
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
                decoration: InputDecoration(
                  hintText: 'Enter income name',
                ),

              ),
              TextField(
                controller: textAmountController,
                decoration: InputDecoration(
                  hintText: 'Enter income amount',
                ),
              )
            ],
          ),
          actions: [
            MaterialButton(
                child: Text(
                  'Add Income',
                  style: TextStyle(
                      fontSize: 18.0
                  ),
                ),
                onPressed: (){save(false);}
            )
          ],
        )
    );
  }

  void save(bool value){

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
        onPressed: addExpense,
      ),

    );
  }
}
