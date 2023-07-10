import 'dart:io';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

part 'schedule_db.g.dart';

class ScheduleTable extends Table {
  Int64Column get id => int64().autoIncrement()();

  DateTimeColumn get date => dateTime()();

  IntColumn get period => integer()();
}

@DriftDatabase(tables: [ScheduleTable])
class ScheduleDatabase extends _$ScheduleDatabase {
  ScheduleDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    print(dbFolder.path);
    final file = File(p.join(dbFolder.path, 'schedule.db'));
    return NativeDatabase(file);
  });
}
