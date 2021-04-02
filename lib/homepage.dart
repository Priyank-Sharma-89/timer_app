import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer_app/countdown_screen.dart';

import 'stopwatch_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
          child: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  child: Container(
                    width: double.infinity,
                    child: Card(
                      elevation: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.timer,
                            size: 56,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Stopwatch",
                            style: theme.textTheme.headline5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return StopwatchScreen();
                    }));
                  },
                ),
                flex: 1,
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: GestureDetector(
                  child: Container(
                    width: double.infinity,
                    child: Card(
                      elevation: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.timelapse_rounded,
                            size: 56,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Countdown",
                            style: theme.textTheme.headline5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CountdownScreen();
                    }));
                  },
                ),
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
