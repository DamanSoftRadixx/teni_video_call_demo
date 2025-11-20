import 'package:freezed_annotation/freezed_annotation.dart';
part 'video_calling_parsing_model.freezed.dart';
part 'video_calling_parsing_model.g.dart';

@freezed
class VideoCallingParsingModel with _$VideoCallingParsingModel {
  const factory VideoCallingParsingModel({
    @JsonKey(name: 'server_url') required String serverUrl,
    @JsonKey(name: 'token') required String token,
    @JsonKey(name: 'room_name') required String roomName,
    @JsonKey(name: 'participant_name') required String participantName,
  }) = _VideoCallingParsingModel;

  factory VideoCallingParsingModel.fromJson(Map<String, Object?> json) =>
      _$VideoCallingParsingModelFromJson(json);
}

// class VideoCallingParsingModel {
//   final String serverUrl;
//   final String token;
//   final String roomName;
//   final String participantName;

//   VideoCallingParsingModel({
//     required this.serverUrl,
//     required this.token,
//     required this.roomName,
//     required this.participantName,
//   });
// }
