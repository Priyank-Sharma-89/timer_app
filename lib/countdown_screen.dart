import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/countdown_provider.dart';

class CountdownScreen extends StatelessWidget {
  final TextEditingController timerValue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.canvasColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Consumer<CountdownProvider>(
        builder: (context, timerProvider, child) {
          int counter = timerProvider.getCounter;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Text(
                      "How many seconds",
                      style: theme.textTheme.headline5,
                    ),
                    Container(
                      width: 80,
                      child: TextField(
                        controller: timerValue,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(3),
                        ],
                        textAlign: TextAlign.center,
                        style: theme.textTheme.subtitle1,
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () {
                          FocusScope.of(context).unfocus();
                          timerProvider.setCounter = int.parse(timerValue.text);
                          print('counter --- ${timerProvider.getCounter}');
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 90,
                ),
                Column(
                  children: [
                    GestureDetector(
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 500),
                            child: timerProvider.getShowText
                                ? Text(
                                    "Let's Go",
                                    key: UniqueKey(),
                                    style: theme.textTheme.headline4,
                                  )
                                : Text(
                                    "$counter",
                                    key: UniqueKey(),
                                    style: theme.textTheme.headline1
                                        .copyWith(fontWeight: FontWeight.w200),
                                  ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Timer.run(() {
                          Timer.periodic(Duration(seconds: 1), (timer) {
                            timerProvider.setShowText = false;
                            if (counter == -1) {
                              timer.cancel();
                            } else {
                              timerProvider.setCounter = counter--;
                            }
                          });
                        });
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Tap on circle to start countdown",
                      style: theme.textTheme.subtitle1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 90,
                ),
                GestureDetector(
                  child: Icon(
                    Icons.replay_sharp,
                    size: 32,
                  ),
                  onTap: () {
                    timerValue.clear();
                    timerProvider.setShowText = true;
                    timerProvider.setCounter = null;
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
