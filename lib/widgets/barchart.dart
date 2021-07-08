import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;
  BarChart({this.expenses});

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;

    expenses.forEach((double price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    });
    return Column(
      children: [
        Text(
          'Weekly Spending',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                size: 30.0,
              ),
            ),
            Text(
              'June 10, 2021 - June 16, 2021',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward,
                size: 30.0,
              ),
            ),
          ],
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Bar(
              label: 'Su',
              amountSpent: expenses[0],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: 'Mo',
              amountSpent: expenses[1],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: 'Tu',
              amountSpent: expenses[2],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: 'We',
              amountSpent: expenses[3],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: 'Th',
              amountSpent: expenses[4],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: 'Fr',
              amountSpent: expenses[5],
              mostExpensive: mostExpensive,
            ),
            Bar(
                label: 'Sa',
                amountSpent: expenses[6],
                mostExpensive: mostExpensive),
          ],
        )
      ],
    );
  }
}

class Bar extends StatelessWidget {
  const Bar({Key key, this.label, this.amountSpent, this.mostExpensive})
      : super(key: key);
  final String label;
  final double amountSpent;
  final double mostExpensive;

  final double _maxBarHeight = 150.0;
  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Column(
      children: [
        Text('\$${amountSpent.toStringAsFixed(2)}'),
        Container(
          width: 18.0,
          height: barHeight,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        Text(label),
      ],
    );
  }
}
