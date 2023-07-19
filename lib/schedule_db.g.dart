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
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scheduleTypeMeta =
      const VerificationMeta('scheduleType');
  @override
  late final GeneratedColumn<int> scheduleType = GeneratedColumn<int>(
      'schedule_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isNoticeMeta =
      const VerificationMeta('isNotice');
  @override
  late final GeneratedColumn<bool> isNotice =
      GeneratedColumn<bool>('is_notice', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_notice" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns =>
      [id, date, period, title, content, scheduleType, isNotice];
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
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('schedule_type')) {
      context.handle(
          _scheduleTypeMeta,
          scheduleType.isAcceptableOrUnknown(
              data['schedule_type']!, _scheduleTypeMeta));
    } else if (isInserting) {
      context.missing(_scheduleTypeMeta);
    }
    if (data.containsKey('is_notice')) {
      context.handle(_isNoticeMeta,
          isNotice.isAcceptableOrUnknown(data['is_notice']!, _isNoticeMeta));
    } else if (isInserting) {
      context.missing(_isNoticeMeta);
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
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      scheduleType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}schedule_type'])!,
      isNotice: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_notice'])!,
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
  final String title;
  final String content;
  final int scheduleType;
  final bool isNotice;
  const ScheduleTableData(
      {required this.id,
      required this.date,
      required this.period,
      required this.title,
      required this.content,
      required this.scheduleType,
      required this.isNotice});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<BigInt>(id);
    map['date'] = Variable<DateTime>(date);
    map['period'] = Variable<int>(period);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['schedule_type'] = Variable<int>(scheduleType);
    map['is_notice'] = Variable<bool>(isNotice);
    return map;
  }

  ScheduleTableCompanion toCompanion(bool nullToAbsent) {
    return ScheduleTableCompanion(
      id: Value(id),
      date: Value(date),
      period: Value(period),
      title: Value(title),
      content: Value(content),
      scheduleType: Value(scheduleType),
      isNotice: Value(isNotice),
    );
  }

  factory ScheduleTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduleTableData(
      id: serializer.fromJson<BigInt>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      period: serializer.fromJson<int>(json['period']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      scheduleType: serializer.fromJson<int>(json['scheduleType']),
      isNotice: serializer.fromJson<bool>(json['isNotice']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<BigInt>(id),
      'date': serializer.toJson<DateTime>(date),
      'period': serializer.toJson<int>(period),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'scheduleType': serializer.toJson<int>(scheduleType),
      'isNotice': serializer.toJson<bool>(isNotice),
    };
  }

  ScheduleTableData copyWith(
          {BigInt? id,
          DateTime? date,
          int? period,
          String? title,
          String? content,
          int? scheduleType,
          bool? isNotice}) =>
      ScheduleTableData(
        id: id ?? this.id,
        date: date ?? this.date,
        period: period ?? this.period,
        title: title ?? this.title,
        content: content ?? this.content,
        scheduleType: scheduleType ?? this.scheduleType,
        isNotice: isNotice ?? this.isNotice,
      );
  @override
  String toString() {
    return (StringBuffer('ScheduleTableData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('period: $period, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('scheduleType: $scheduleType, ')
          ..write('isNotice: $isNotice')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, date, period, title, content, scheduleType, isNotice);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduleTableData &&
          other.id == this.id &&
          other.date == this.date &&
          other.period == this.period &&
          other.title == this.title &&
          other.content == this.content &&
          other.scheduleType == this.scheduleType &&
          other.isNotice == this.isNotice);
}

class ScheduleTableCompanion extends UpdateCompanion<ScheduleTableData> {
  final Value<BigInt> id;
  final Value<DateTime> date;
  final Value<int> period;
  final Value<String> title;
  final Value<String> content;
  final Value<int> scheduleType;
  final Value<bool> isNotice;
  const ScheduleTableCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.period = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.scheduleType = const Value.absent(),
    this.isNotice = const Value.absent(),
  });
  ScheduleTableCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required int period,
    required String title,
    required String content,
    required int scheduleType,
    required bool isNotice,
  })  : date = Value(date),
        period = Value(period),
        title = Value(title),
        content = Value(content),
        scheduleType = Value(scheduleType),
        isNotice = Value(isNotice);
  static Insertable<ScheduleTableData> custom({
    Expression<BigInt>? id,
    Expression<DateTime>? date,
    Expression<int>? period,
    Expression<String>? title,
    Expression<String>? content,
    Expression<int>? scheduleType,
    Expression<bool>? isNotice,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (period != null) 'period': period,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (scheduleType != null) 'schedule_type': scheduleType,
      if (isNotice != null) 'is_notice': isNotice,
    });
  }

  ScheduleTableCompanion copyWith(
      {Value<BigInt>? id,
      Value<DateTime>? date,
      Value<int>? period,
      Value<String>? title,
      Value<String>? content,
      Value<int>? scheduleType,
      Value<bool>? isNotice}) {
    return ScheduleTableCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      period: period ?? this.period,
      title: title ?? this.title,
      content: content ?? this.content,
      scheduleType: scheduleType ?? this.scheduleType,
      isNotice: isNotice ?? this.isNotice,
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
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (scheduleType.present) {
      map['schedule_type'] = Variable<int>(scheduleType.value);
    }
    if (isNotice.present) {
      map['is_notice'] = Variable<bool>(isNotice.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleTableCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('period: $period, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('scheduleType: $scheduleType, ')
          ..write('isNotice: $isNotice')
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
