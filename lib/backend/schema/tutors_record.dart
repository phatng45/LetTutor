import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tutors_record.g.dart';

abstract class TutorsRecord
    implements Built<TutorsRecord, TutorsRecordBuilder> {
  static Serializer<TutorsRecord> get serializer => _$tutorsRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  String? get bio;

  @BuiltValueField(wireName: 'user_name')
  String? get userName;

  @BuiltValueField(wireName: 'is_favorited')
  bool? get isFavorited;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TutorsRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..bio = ''
    ..userName = ''
    ..isFavorited = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tutors');

  static Stream<TutorsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TutorsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TutorsRecord._();
  factory TutorsRecord([void Function(TutorsRecordBuilder) updates]) =
      _$TutorsRecord;

  static TutorsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTutorsRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? bio,
  String? userName,
  bool? isFavorited,
}) {
  final firestoreData = serializers.toFirestore(
    TutorsRecord.serializer,
    TutorsRecord(
      (t) => t
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..bio = bio
        ..userName = userName
        ..isFavorited = isFavorited,
    ),
  );

  return firestoreData;
}
