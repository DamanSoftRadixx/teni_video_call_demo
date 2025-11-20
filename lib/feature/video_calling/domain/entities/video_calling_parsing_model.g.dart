// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_calling_parsing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoCallingParsingModelImpl _$$VideoCallingParsingModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VideoCallingParsingModelImpl(
      serverUrl: json['server_url'] as String,
      token: json['token'] as String,
      roomName: json['room_name'] as String,
      participantName: json['participant_name'] as String,
    );

Map<String, dynamic> _$$VideoCallingParsingModelImplToJson(
        _$VideoCallingParsingModelImpl instance) =>
    <String, dynamic>{
      'server_url': instance.serverUrl,
      'token': instance.token,
      'room_name': instance.roomName,
      'participant_name': instance.participantName,
    };
