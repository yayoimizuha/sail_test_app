import 'package:flutter/material.dart';
import 'package:test_app/constants.dart';
import 'package:test_app/schedule_db.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.database});

  final ScheduleDatabase database;

  @override
  State<StatefulWidget> createState() => _SettingsPageState(database);
}

class _SettingsPageState extends State<SettingsPage> {
  var _date = DateTime.now();
  var _notice = true;
  var _icon = const Icon(Icons.notifications_off_outlined);
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  var _period = 0;
  final timeList = [
    for (int i = 0; i < TimeTable.time.length; i++)
      DropdownMenuItem(
        value: i,
        child: Text(TimeTable.time[i]),
      )
  ];

  _SettingsPageState(ScheduleDatabase database);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('予定を追加'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            OutlinedButton.icon(
              onPressed: () => {
                showDatePicker(
                  context: context,
                  initialDate: _date,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                ).then((date) => setState(() {
                      if (date != null) {
                        _date = date;
                      }
                    }))
              },
              label: Text(_date.toIso8601String().split('T')[0]),
              icon: const Icon(Icons.calendar_month),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: SwitchListTile(
                title: const Text("通知"),
                secondary: _icon,
                value: _notice,
                onChanged: (bool value) => setState(() {
                  _notice = !_notice;
                  print('通知: $_notice');

                  if (_notice == true) {
                    _icon = const Icon(Icons.notifications_active_outlined);
                  } else {
                    _icon = const Icon(Icons.notifications_off_outlined);
                  }
                }),
              ),
            ),
            DropdownButton(
              items: timeList,
              onChanged: (value) => {
                setState(() {
                  _period = value as int;
                })
              },
              value: _period,
            ),
            Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'タイトル',
                  ),
                )),
            Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  controller: _commentController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'コメント',
                  ),
                  maxLines: null,
                )),
            ElevatedButton(
              onPressed: () => {
                widget.database.addSchedule(
                    '${_titleController.text}\n${_commentController.text}',
                    _date,
                    _period,
                    2),
                _titleController.clear(),
                _commentController.clear(),
              },
              child: const Text(
                '追加',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
