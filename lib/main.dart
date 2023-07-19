import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:test_app/schedule.dart';
import 'package:test_app/schedule_db.dart';
import 'package:test_app/add_orig.dart';

void main() {
  const String sysLoc = 'ja_JP';
  Intl.defaultLocale = sysLoc;
  initializeDateFormatting(sysLoc);
  final scheduleDatabase = ScheduleDatabase();
  runApp(MyApp(scheduleDatabase: scheduleDatabase));
  scheduleDatabase.close();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.scheduleDatabase});

  final ScheduleDatabase scheduleDatabase;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Thursday', scheduleDatabase: scheduleDatabase),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key, required this.title, required this.scheduleDatabase});

  final String title;
  final ScheduleDatabase scheduleDatabase;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dateTime = DateTime.now();
  var dateStr =
      DateFormat.yMMMd(Intl.defaultLocale).format(DateTime.now()).toString();
  var weekStr =
      DateFormat.EEEE(Intl.defaultLocale).format(DateTime.now()).toString();

  void tomorrow() {
    setState(() {
      dateTime = dateTime.add(const Duration(days: 1));
      dateStr =
          DateFormat.yMMMd(Intl.defaultLocale).format(dateTime).toString();
      weekStr = DateFormat.EEEE(Intl.defaultLocale).format(dateTime).toString();
    });
  }

  void yesterday() {
    setState(() {
      dateTime = dateTime.add(const Duration(days: -1));
      dateStr =
          DateFormat.yMMMd(Intl.defaultLocale).format(dateTime).toString();
      weekStr = DateFormat.EEEE(Intl.defaultLocale).format(dateTime).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('$dateStr $weekStr'),
        actions: <Widget>[
          IconButton(
            onPressed: () => {widget.scheduleDatabase.clearAll()},
            icon: const Icon(Icons.delete_outline_sharp),
            tooltip: 'clear database',
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
          ),
          IconButton(
              onPressed: () => setState(() {
                    dateTime = DateTime.now();
                    dateStr = DateFormat.yMMMd(Intl.defaultLocale)
                        .format(dateTime)
                        .toString();
                    weekStr = DateFormat.EEEE(Intl.defaultLocale)
                        .format(DateTime.now())
                        .toString();
                  }),
              icon: const Icon(Icons.home))
        ],
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => {print("aaa")},
        onHorizontalDragEnd: (detail) => {
          if (detail.primaryVelocity! > 100)
            setState(() {
              tomorrow();
            })
          else if (detail.primaryVelocity! < 100)
            setState(() {
              yesterday();
            })
        },
        onVerticalDragEnd: (detail) => {
          if (detail.primaryVelocity! < 100)
            setState(() {
              for (int i = 0; i < 7; i++) {
                tomorrow();
              }
            })
          else if (detail.primaryVelocity! > 100)
            setState(() {
              for (int i = 0; i < 7; i++) {
                yesterday();
              }
            })
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Schedule(datetime: dateTime)))
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 20)),
                child: Text(
                  "時間割",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              Text(
                dateStr,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SettingsPage(database: widget.scheduleDatabase)))
        },
        tooltip: 'Add event',
        child: const Icon(Icons.add),
      ),
    );
  }
}
