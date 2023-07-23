import 'package:flutter/material.dart';
import 'package:expense_manager/home_page.dart';

void main() => runApp(const ExpenseManager());

class ExpenseManager extends StatelessWidget {
  const ExpenseManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(color: Colors.blue[900])
      ),
      home: HomePage(),
    );
  }
}



