import 'constants.dart';

import 'package:flutter/material.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key, required this.datetime});

  final DateTime datetime;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            title:
                Text('Schedule ${datetime.toIso8601String().split('T')[0]}')),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 0; i < 10; i++)
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      alignment: Alignment.center,
                      color: Colors.blue,
                      child: Column(children: <Widget>[
                        Container(
                            margin: const EdgeInsets.all(1),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              TimeTable.time[i],
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            )),
                        Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              child: const Text("aaaa")),
                        ),
                      ]))),
            Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.pop(context),
                  },
                  child: const Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ))
          ],
        )));
  }
}
