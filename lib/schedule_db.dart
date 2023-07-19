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

  TextColumn get title => text()();

  TextColumn get content => text()();

  IntColumn get scheduleType => integer()();

  BoolColumn get isNotice => boolean()();
}

@DriftDatabase(tables: [ScheduleTable])
class ScheduleDatabase extends _$ScheduleDatabase {
  ScheduleDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<ScheduleTableData>> watchEntries() {
    return (select(scheduleTable)).watch();
  }

  Future<List<ScheduleTableData>> getAllEntries() {
    return select(scheduleTable).get();
  }

  Future<int> addSchedule(String title, String content, DateTime date,
      int period, int scheduleType, bool isNotice) {
    return into(scheduleTable).insert(ScheduleTableCompanion(
        title: Value(title),
        content: Value(content),
        date: Value(date),
        period: Value(period),
        scheduleType: Value(scheduleType),
        isNotice: Value(isNotice)));
  }

  Future<int> clearAll() {
    return delete(scheduleTable).go();
  }

  Future<int> deleteSchedule(ScheduleTableData schedule) {
    return (delete(scheduleTable)..where((tbl) => tbl.id.equals(schedule.id)))
        .go();
  }

  Future<int> updateSchedule(ScheduleTableData schedule, String title,
      String content, DateTime date, int period, bool isNotice) {
    return (update(scheduleTable)..where((tbl) => tbl.id.equals(schedule.id)))
        .write(ScheduleTableCompanion(
            title: Value(title),
            content: Value(content),
            date: Value(date),
            period: Value(period),
            scheduleType: Value(schedule.scheduleType),
            isNotice: Value(isNotice)));
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'schedule.db'));
    return NativeDatabase(file);
  });
}
