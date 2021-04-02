import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/homepage.dart';
import 'package:timer_app/stopwatch_provider.dart';

import 'countdown_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CountdownProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => StopwatchProvider(),
        ),
      ],
      child: MaterialApp(
        home: HomePage(),
        theme: ThemeData(
          canvasColor: Colors.lightBlue[100],
        ),
      ),
    );
  }
}
