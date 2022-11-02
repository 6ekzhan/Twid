import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'routes_record.g.dart';

abstract class RoutesRecord
    implements Built<RoutesRecord, RoutesRecordBuilder> {
  static Serializer<RoutesRecord> get serializer => _$routesRecordSerializer;

  @BuiltValueField(wireName: 'Points')
  BuiltList<LatLng>? get points;

  @BuiltValueField(wireName: 'Index')
  BuiltList<int>? get index;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RoutesRecordBuilder builder) => builder
    ..points = ListBuilder()
    ..index = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Routes');

  static Stream<RoutesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RoutesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RoutesRecord._();
  factory RoutesRecord([void Function(RoutesRecordBuilder) updates]) =
      _$RoutesRecord;

  static RoutesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRoutesRecordData() {
  final firestoreData = serializers.toFirestore(
    RoutesRecord.serializer,
    RoutesRecord(
      (r) => r
        ..points = null
        ..index = null,
    ),
  );

  return firestoreData;
}
