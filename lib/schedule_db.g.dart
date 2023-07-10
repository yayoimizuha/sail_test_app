// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_db.dart';

// ignore_for_file: type=lint
class $ScheduleTableTable extends ScheduleTable
    with TableInfo<$ScheduleTableTable, ScheduleTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $ScheduleTableTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<BigInt> id = GeneratedColumn<BigInt>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.bigInt,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _periodMeta = const VerificationMeta('period');
  @override
  late final GeneratedColumn<int> period = GeneratedColumn<int>(
      'period', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);

  @override
  List<GeneratedColumn> get $columns => [id, date, period];

  @override
  String get aliasedName => _alias ?? 'schedule_table';

  @override
  String get actualTableName => 'schedule_table';

  @override
  VerificationContext validateIntegrity(Insertable<ScheduleTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('period')) {
      context.handle(_periodMeta,
          period.isAcceptableOrUnknown(data['period']!, _periodMeta));
    } else if (isInserting) {
      context.missing(_periodMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  ScheduleTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScheduleTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.bigInt, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      period: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}period'])!,
    );
  }

  @override
  $ScheduleTableTable createAlias(String alias) {
    return $ScheduleTableTable(attachedDatabase, alias);
  }
}

class ScheduleTableData extends DataClass
    implements Insertable<ScheduleTableData> {
  final BigInt id;
  final DateTime date;
  final int period;

  const ScheduleTableData(
      {required this.id, required this.date, required this.period});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<BigInt>(id);
    map['date'] = Variable<DateTime>(date);
    map['period'] = Variable<int>(period);
    return map;
  }

  ScheduleTableCompanion toCompanion(bool nullToAbsent) {
    return ScheduleTableCompanion(
      id: Value(id),
      date: Value(date),
      period: Value(period),
    );
  }

  factory ScheduleTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduleTableData(
      id: serializer.fromJson<BigInt>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      period: serializer.fromJson<int>(json['period']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<BigInt>(id),
      'date': serializer.toJson<DateTime>(date),
      'period': serializer.toJson<int>(period),
    };
  }

  ScheduleTableData copyWith({BigInt? id, DateTime? date, int? period}) =>
      ScheduleTableData(
        id: id ?? this.id,
        date: date ?? this.date,
        period: period ?? this.period,
      );

  @override
  String toString() {
    return (StringBuffer('ScheduleTableData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('period: $period')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, period);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduleTableData &&
          other.id == this.id &&
          other.date == this.date &&
          other.period == this.period);
}

class ScheduleTableCompanion extends UpdateCompanion<ScheduleTableData> {
  final Value<BigInt> id;
  final Value<DateTime> date;
  final Value<int> period;

  const ScheduleTableCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.period = const Value.absent(),
  });

  ScheduleTableCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required int period,
  })  : date = Value(date),
        period = Value(period);

  static Insertable<ScheduleTableData> custom({
    Expression<BigInt>? id,
    Expression<DateTime>? date,
    Expression<int>? period,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (period != null) 'period': period,
    });
  }

  ScheduleTableCompanion copyWith(
      {Value<BigInt>? id, Value<DateTime>? date, Value<int>? period}) {
    return ScheduleTableCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      period: period ?? this.period,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<BigInt>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (period.present) {
      map['period'] = Variable<int>(period.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleTableCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('period: $period')
          ..write(')'))
        .toString();
  }
}

abstract class _$ScheduleDatabase extends GeneratedDatabase {
  _$ScheduleDatabase(QueryExecutor e) : super(e);
  late final $ScheduleTableTable scheduleTable = $ScheduleTableTable(this);

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();

  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [scheduleTable];
}
