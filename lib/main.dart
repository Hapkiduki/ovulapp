import 'package:ovulapp/src/pages/home_page.dart';
import 'package:flutter/material.dart';

main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ovulation App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => MyHomePage(),
      },
    );
  }
}

