import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_calling_event.freezed.dart';

@freezed
class VideoCallingEvent with _$VideoCallingEvent {
  const factory VideoCallingEvent.initial() = InitialEvent;
}
