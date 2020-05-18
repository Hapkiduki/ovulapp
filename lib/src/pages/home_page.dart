import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ovulapp/src/widgets/spin.dart';
import 'package:ovulapp/src/pages/test.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int day = 5;
    final fecha = DateFormat('dd-MM-yyyy').format(DateTime.now());

    return Scaffold(
      body: Container(
        child: _CustomSpin(day: day, fecha: fecha),
      ),
    );
  }
}

class _CustomSpin extends StatelessWidget {
  const _CustomSpin({
    Key key,
    @required this.day,
    @required this.fecha,
    
  }) : super(key: key);

  final int day;
  final String fecha;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Spin(
          day: day,
          lastDay: 3,
          child: Column(
            children: <Widget>[
              Text(
                'Prediction Period',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                'Day $day',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                fecha,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
