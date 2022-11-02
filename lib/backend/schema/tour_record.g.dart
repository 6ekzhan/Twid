// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TourRecord> _$tourRecordSerializer = new _$TourRecordSerializer();

class _$TourRecordSerializer implements StructuredSerializer<TourRecord> {
  @override
  final Iterable<Type> types = const [TourRecord, _$TourRecord];
  @override
  final String wireName = 'TourRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TourRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.calendar;
    if (value != null) {
      result
        ..add('Calendar')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.timer;
    if (value != null) {
      result
        ..add('Timer')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  TourRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TourRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Calendar':
          result.calendar = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Timer':
          result.timer = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$TourRecord extends TourRecord {
  @override
  final DateTime? calendar;
  @override
  final int? timer;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TourRecord([void Function(TourRecordBuilder)? updates]) =>
      (new TourRecordBuilder()..update(updates))._build();

  _$TourRecord._({this.calendar, this.timer, this.ffRef}) : super._();

  @override
  TourRecord rebuild(void Function(TourRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TourRecordBuilder toBuilder() => new TourRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TourRecord &&
        calendar == other.calendar &&
        timer == other.timer &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, calendar.hashCode), timer.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TourRecord')
          ..add('calendar', calendar)
          ..add('timer', timer)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TourRecordBuilder implements Builder<TourRecord, TourRecordBuilder> {
  _$TourRecord? _$v;

  DateTime? _calendar;
  DateTime? get calendar => _$this._calendar;
  set calendar(DateTime? calendar) => _$this._calendar = calendar;

  int? _timer;
  int? get timer => _$this._timer;
  set timer(int? timer) => _$this._timer = timer;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TourRecordBuilder() {
    TourRecord._initializeBuilder(this);
  }

  TourRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _calendar = $v.calendar;
      _timer = $v.timer;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TourRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TourRecord;
  }

  @override
  void update(void Function(TourRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TourRecord build() => _build();

  _$TourRecord _build() {
    final _$result = _$v ??
        new _$TourRecord._(calendar: calendar, timer: timer, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
