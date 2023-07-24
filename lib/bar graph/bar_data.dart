import 'package:expense_manager/bar graph/indivisual_bar.dart';
class BarData{
  final double sunAmount;
  final double monAmount;
  final double tuesAmount;
  final double wedAmount;
  final double thursAmount;
  final double friAmount;
  final double satAmount;

  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tuesAmount,
    required this.wedAmount,
    required this.thursAmount,
    required this.friAmount,
    required this.satAmount
  });

  List<IndivisualBar> barData = [];

  void initialize(){
    barData = [
      IndivisualBar(x: 0, y: sunAmount),
      IndivisualBar(x: 1, y: monAmount),
      IndivisualBar(x: 2, y: tuesAmount),
      IndivisualBar(x: 3, y: wedAmount),
      IndivisualBar(x: 4, y: thursAmount),
      IndivisualBar(x: 5, y: friAmount),
      IndivisualBar(x: 6, y: satAmount),
    ];
  }

}