import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/stopwatch_provider.dart';

class StopwatchScreen extends StatefulWidget {
  @override
  _StopwatchScreenState createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  Timer myTimer;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.canvasColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Consumer<StopwatchProvider>(
        builder: (context, stpProvider, child) {
          int mlSec = stpProvider.getMilliseconds;
          int sec = stpProvider.getSeconds;
          int mint = stpProvider.getMinutes;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "M",
                        style: theme.textTheme.headline5,
                      ),
                      Text(
                        '${stpProvider.getMinutes}',
                        style: theme.textTheme.headline4,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Text(
                          "",
                          style: theme.textTheme.headline5,
                        ),
                        Text(
                          ':',
                          style: theme.textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "S",
                        style: theme.textTheme.headline5,
                      ),
                      Text(
                        '${stpProvider.getSeconds}',
                        style: theme.textTheme.headline4,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Text(
                          "",
                          style: theme.textTheme.headline5,
                        ),
                        Text(
                          ':',
                          style: theme.textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "ms",
                        style: theme.textTheme.headline5,
                      ),
                      Text(
                        '${stpProvider.getMilliseconds}',
                        style: theme.textTheme.headline4,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text("Start"),
                    onPressed: () {
                      Timer.run(() {
                        Timer.periodic(Duration(milliseconds: 1), (myTimer) {
                          if (mlSec <= 999) {
                            stpProvider.setMilliseconds = mlSec++;
                          } else {
                            stpProvider.setMilliseconds = 0;
                            if (sec <= 59) {
                              stpProvider.setSeconds = sec++;
                            } else {
                              stpProvider.setSeconds = 0;
                              stpProvider.setMinutes = mint++;
                            }
                          }
                        });
                        Timer.periodic(Duration(seconds: 1), (secTimer) {
                          if (sec <= 59) {
                            stpProvider.setSeconds = sec++;
                          } else {
                            stpProvider.setSeconds = 0;
                          }
                        });
                        Timer.periodic(Duration(minutes: 1), (minTimer) {
                          stpProvider.setMinutes = mint++;
                        });
                      });
                    },
                  ),
                  ElevatedButton(
                    child: Text("Lap"),
                    onPressed: () {
                      //later
                    },
                  ),
                  ElevatedButton(
                    child: Text("Stop"),
                    onPressed: () {
                      myTimer.cancel();
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
