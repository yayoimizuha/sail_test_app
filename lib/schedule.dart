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
            Text('Schedule ${datetime.toIso8601String().split('T')[0]}'),
            ElevatedButton(
              onPressed: () => {
                Navigator.pop(context),
              },
              child: const Text('Back'),
            ),
            for (int i = 0; i < 10; i++)
              Text('Schedule ${datetime.toIso8601String().split('T')[0]}\n'),
          ],
        )));
  }
}
