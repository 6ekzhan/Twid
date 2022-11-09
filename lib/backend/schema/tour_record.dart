import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tour_record.g.dart';

abstract class TourRecord implements Built<TourRecord, TourRecordBuilder> {
  static Serializer<TourRecord> get serializer => _$tourRecordSerializer;

  @BuiltValueField(wireName: 'Calendar')
  DateTime? get calendar;

  @BuiltValueField(wireName: 'Timer')
  int? get timer;

  int? get pinput;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TourRecordBuilder builder) => builder
    ..timer = 0
    ..pinput = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Tour');

  static Stream<TourRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TourRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TourRecord._();
  factory TourRecord([void Function(TourRecordBuilder) updates]) = _$TourRecord;

  static TourRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTourRecordData({
  DateTime? calendar,
  int? timer,
  int? pinput,
}) {
  final firestoreData = serializers.toFirestore(
    TourRecord.serializer,
    TourRecord(
      (t) => t
        ..calendar = calendar
        ..timer = timer
        ..pinput = pinput,
    ),
  );

  return firestoreData;
}
