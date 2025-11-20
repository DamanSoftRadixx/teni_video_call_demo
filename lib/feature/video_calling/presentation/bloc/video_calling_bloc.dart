import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teni_video_call_demo/feature/video_calling/presentation/bloc/video_calling_event.dart';
import 'package:teni_video_call_demo/feature/video_calling/presentation/bloc/video_calling_state.dart';

class VideoCallingBloc extends Bloc<VideoCallingEvent, VideoCallingState> {
  VideoCallingBloc() : super(VideoCallingState.initial());
}
