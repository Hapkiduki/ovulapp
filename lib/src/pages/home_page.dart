import 'package:flutter/material.dart';
import 'package:ovulapp/src/widgets/spin.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 250,
          height: 250,
          child: Spin( percentage: 20,),
        ),
      ),
    );
  }
}

