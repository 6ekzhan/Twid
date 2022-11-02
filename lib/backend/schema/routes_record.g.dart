// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RoutesRecord> _$routesRecordSerializer =
    new _$RoutesRecordSerializer();

class _$RoutesRecordSerializer implements StructuredSerializer<RoutesRecord> {
  @override
  final Iterable<Type> types = const [RoutesRecord, _$RoutesRecord];
  @override
  final String wireName = 'RoutesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RoutesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.points;
    if (value != null) {
      result
        ..add('Points')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(LatLng)])));
    }
    value = object.index;
    if (value != null) {
      result
        ..add('Index')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
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
  RoutesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RoutesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Points':
          result.points.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(LatLng)]))!
              as BuiltList<Object?>);
          break;
        case 'Index':
          result.index.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
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

class _$RoutesRecord extends RoutesRecord {
  @override
  final BuiltList<LatLng>? points;
  @override
  final BuiltList<int>? index;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RoutesRecord([void Function(RoutesRecordBuilder)? updates]) =>
      (new RoutesRecordBuilder()..update(updates))._build();

  _$RoutesRecord._({this.points, this.index, this.ffRef}) : super._();

  @override
  RoutesRecord rebuild(void Function(RoutesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RoutesRecordBuilder toBuilder() => new RoutesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RoutesRecord &&
        points == other.points &&
        index == other.index &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, points.hashCode), index.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RoutesRecord')
          ..add('points', points)
          ..add('index', index)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RoutesRecordBuilder
    implements Builder<RoutesRecord, RoutesRecordBuilder> {
  _$RoutesRecord? _$v;

  ListBuilder<LatLng>? _points;
  ListBuilder<LatLng> get points =>
      _$this._points ??= new ListBuilder<LatLng>();
  set points(ListBuilder<LatLng>? points) => _$this._points = points;

  ListBuilder<int>? _index;
  ListBuilder<int> get index => _$this._index ??= new ListBuilder<int>();
  set index(ListBuilder<int>? index) => _$this._index = index;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RoutesRecordBuilder() {
    RoutesRecord._initializeBuilder(this);
  }

  RoutesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _points = $v.points?.toBuilder();
      _index = $v.index?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RoutesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RoutesRecord;
  }

  @override
  void update(void Function(RoutesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RoutesRecord build() => _build();

  _$RoutesRecord _build() {
    _$RoutesRecord _$result;
    try {
      _$result = _$v ??
          new _$RoutesRecord._(
              points: _points?.build(), index: _index?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'points';
        _points?.build();
        _$failedField = 'index';
        _index?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RoutesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
