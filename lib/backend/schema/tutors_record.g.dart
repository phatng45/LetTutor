// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutors_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TutorsRecord> _$tutorsRecordSerializer =
    new _$TutorsRecordSerializer();

class _$TutorsRecordSerializer implements StructuredSerializer<TutorsRecord> {
  @override
  final Iterable<Type> types = const [TutorsRecord, _$TutorsRecord];
  @override
  final String wireName = 'TutorsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TutorsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.bio;
    if (value != null) {
      result
        ..add('bio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userName;
    if (value != null) {
      result
        ..add('user_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isFavorited;
    if (value != null) {
      result
        ..add('is_favorited')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.specialties;
    if (value != null) {
      result
        ..add('specialties')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  TutorsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TutorsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_name':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_favorited':
          result.isFavorited = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'specialties':
          result.specialties.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
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

class _$TutorsRecord extends TutorsRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? bio;
  @override
  final String? userName;
  @override
  final bool? isFavorited;
  @override
  final BuiltList<String>? specialties;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TutorsRecord([void Function(TutorsRecordBuilder)? updates]) =>
      (new TutorsRecordBuilder()..update(updates))._build();

  _$TutorsRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.bio,
      this.userName,
      this.isFavorited,
      this.specialties,
      this.ffRef})
      : super._();

  @override
  TutorsRecord rebuild(void Function(TutorsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TutorsRecordBuilder toBuilder() => new TutorsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TutorsRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        bio == other.bio &&
        userName == other.userName &&
        isFavorited == other.isFavorited &&
        specialties == other.specialties &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, email.hashCode),
                                        displayName.hashCode),
                                    photoUrl.hashCode),
                                uid.hashCode),
                            createdTime.hashCode),
                        bio.hashCode),
                    userName.hashCode),
                isFavorited.hashCode),
            specialties.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TutorsRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('bio', bio)
          ..add('userName', userName)
          ..add('isFavorited', isFavorited)
          ..add('specialties', specialties)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TutorsRecordBuilder
    implements Builder<TutorsRecord, TutorsRecordBuilder> {
  _$TutorsRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  bool? _isFavorited;
  bool? get isFavorited => _$this._isFavorited;
  set isFavorited(bool? isFavorited) => _$this._isFavorited = isFavorited;

  ListBuilder<String>? _specialties;
  ListBuilder<String> get specialties =>
      _$this._specialties ??= new ListBuilder<String>();
  set specialties(ListBuilder<String>? specialties) =>
      _$this._specialties = specialties;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TutorsRecordBuilder() {
    TutorsRecord._initializeBuilder(this);
  }

  TutorsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _bio = $v.bio;
      _userName = $v.userName;
      _isFavorited = $v.isFavorited;
      _specialties = $v.specialties?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TutorsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TutorsRecord;
  }

  @override
  void update(void Function(TutorsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TutorsRecord build() => _build();

  _$TutorsRecord _build() {
    _$TutorsRecord _$result;
    try {
      _$result = _$v ??
          new _$TutorsRecord._(
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              bio: bio,
              userName: userName,
              isFavorited: isFavorited,
              specialties: _specialties?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'specialties';
        _specialties?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TutorsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
