import 'package:expense_manager/data/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:expense_manager/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(const ExpenseManager());

class ExpenseManager extends StatelessWidget {
  const ExpenseManager({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ExpenseData(),
      builder: (context,child) => MaterialApp(
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(color: Colors.blue[900]),
        ),
        home: HomePage(),
      )
    );
  }
}


