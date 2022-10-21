import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'location_record.g.dart';

abstract class LocationRecord
    implements Built<LocationRecord, LocationRecordBuilder> {
  static Serializer<LocationRecord> get serializer =>
      _$locationRecordSerializer;

  LatLng? get point1;

  LatLng? get point2;

  LatLng? get point3;

  LatLng? get point4;

  DocumentReference? get pointS;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(LocationRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('location');

  static Stream<LocationRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<LocationRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  LocationRecord._();
  factory LocationRecord([void Function(LocationRecordBuilder) updates]) =
      _$LocationRecord;

  static LocationRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createLocationRecordData({
  LatLng? point1,
  LatLng? point2,
  LatLng? point3,
  LatLng? point4,
  DocumentReference? pointS,
}) {
  final firestoreData = serializers.toFirestore(
    LocationRecord.serializer,
    LocationRecord(
      (l) => l
        ..point1 = point1
        ..point2 = point2
        ..point3 = point3
        ..point4 = point4
        ..pointS = pointS,
    ),
  );

  return firestoreData;
}
