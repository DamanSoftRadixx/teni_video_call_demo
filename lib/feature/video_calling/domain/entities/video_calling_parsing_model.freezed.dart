// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_calling_parsing_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VideoCallingParsingModel _$VideoCallingParsingModelFromJson(
    Map<String, dynamic> json) {
  return _VideoCallingParsingModel.fromJson(json);
}

/// @nodoc
mixin _$VideoCallingParsingModel {
  @JsonKey(name: 'server_url')
  String get serverUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'token')
  String get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'room_name')
  String get roomName => throw _privateConstructorUsedError;
  @JsonKey(name: 'participant_name')
  String get participantName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoCallingParsingModelCopyWith<VideoCallingParsingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoCallingParsingModelCopyWith<$Res> {
  factory $VideoCallingParsingModelCopyWith(VideoCallingParsingModel value,
          $Res Function(VideoCallingParsingModel) then) =
      _$VideoCallingParsingModelCopyWithImpl<$Res, VideoCallingParsingModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'server_url') String serverUrl,
      @JsonKey(name: 'token') String token,
      @JsonKey(name: 'room_name') String roomName,
      @JsonKey(name: 'participant_name') String participantName});
}

/// @nodoc
class _$VideoCallingParsingModelCopyWithImpl<$Res,
        $Val extends VideoCallingParsingModel>
    implements $VideoCallingParsingModelCopyWith<$Res> {
  _$VideoCallingParsingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverUrl = null,
    Object? token = null,
    Object? roomName = null,
    Object? participantName = null,
  }) {
    return _then(_value.copyWith(
      serverUrl: null == serverUrl
          ? _value.serverUrl
          : serverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      roomName: null == roomName
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String,
      participantName: null == participantName
          ? _value.participantName
          : participantName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoCallingParsingModelImplCopyWith<$Res>
    implements $VideoCallingParsingModelCopyWith<$Res> {
  factory _$$VideoCallingParsingModelImplCopyWith(
          _$VideoCallingParsingModelImpl value,
          $Res Function(_$VideoCallingParsingModelImpl) then) =
      __$$VideoCallingParsingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'server_url') String serverUrl,
      @JsonKey(name: 'token') String token,
      @JsonKey(name: 'room_name') String roomName,
      @JsonKey(name: 'participant_name') String participantName});
}

/// @nodoc
class __$$VideoCallingParsingModelImplCopyWithImpl<$Res>
    extends _$VideoCallingParsingModelCopyWithImpl<$Res,
        _$VideoCallingParsingModelImpl>
    implements _$$VideoCallingParsingModelImplCopyWith<$Res> {
  __$$VideoCallingParsingModelImplCopyWithImpl(
      _$VideoCallingParsingModelImpl _value,
      $Res Function(_$VideoCallingParsingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverUrl = null,
    Object? token = null,
    Object? roomName = null,
    Object? participantName = null,
  }) {
    return _then(_$VideoCallingParsingModelImpl(
      serverUrl: null == serverUrl
          ? _value.serverUrl
          : serverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      roomName: null == roomName
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String,
      participantName: null == participantName
          ? _value.participantName
          : participantName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoCallingParsingModelImpl implements _VideoCallingParsingModel {
  const _$VideoCallingParsingModelImpl(
      {@JsonKey(name: 'server_url') required this.serverUrl,
      @JsonKey(name: 'token') required this.token,
      @JsonKey(name: 'room_name') required this.roomName,
      @JsonKey(name: 'participant_name') required this.participantName});

  factory _$VideoCallingParsingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoCallingParsingModelImplFromJson(json);

  @override
  @JsonKey(name: 'server_url')
  final String serverUrl;
  @override
  @JsonKey(name: 'token')
  final String token;
  @override
  @JsonKey(name: 'room_name')
  final String roomName;
  @override
  @JsonKey(name: 'participant_name')
  final String participantName;

  @override
  String toString() {
    return 'VideoCallingParsingModel(serverUrl: $serverUrl, token: $token, roomName: $roomName, participantName: $participantName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoCallingParsingModelImpl &&
            (identical(other.serverUrl, serverUrl) ||
                other.serverUrl == serverUrl) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.roomName, roomName) ||
                other.roomName == roomName) &&
            (identical(other.participantName, participantName) ||
                other.participantName == participantName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, serverUrl, token, roomName, participantName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoCallingParsingModelImplCopyWith<_$VideoCallingParsingModelImpl>
      get copyWith => __$$VideoCallingParsingModelImplCopyWithImpl<
          _$VideoCallingParsingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoCallingParsingModelImplToJson(
      this,
    );
  }
}

abstract class _VideoCallingParsingModel implements VideoCallingParsingModel {
  const factory _VideoCallingParsingModel(
      {@JsonKey(name: 'server_url') required final String serverUrl,
      @JsonKey(name: 'token') required final String token,
      @JsonKey(name: 'room_name') required final String roomName,
      @JsonKey(name: 'participant_name')
      required final String participantName}) = _$VideoCallingParsingModelImpl;

  factory _VideoCallingParsingModel.fromJson(Map<String, dynamic> json) =
      _$VideoCallingParsingModelImpl.fromJson;

  @override
  @JsonKey(name: 'server_url')
  String get serverUrl;
  @override
  @JsonKey(name: 'token')
  String get token;
  @override
  @JsonKey(name: 'room_name')
  String get roomName;
  @override
  @JsonKey(name: 'participant_name')
  String get participantName;
  @override
  @JsonKey(ignore: true)
  _$$VideoCallingParsingModelImplCopyWith<_$VideoCallingParsingModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
