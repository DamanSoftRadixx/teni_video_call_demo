import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_calling_state.freezed.dart';

@freezed
class VideoCallingState with _$VideoCallingState {
  const factory VideoCallingState.initial() = InitialEvent;
  const factory VideoCallingState.success() = SuccessEvent;
  const factory VideoCallingState.failure(String error) = FailureEvent;
}
