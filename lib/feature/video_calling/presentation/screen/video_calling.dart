import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:teni_video_call_demo/core/routes/routes.dart';
import 'package:teni_video_call_demo/feature/video_calling/presentation/bloc/video_calling_bloc.dart';
import 'package:teni_video_call_demo/feature/video_calling/presentation/bloc/video_calling_state.dart';
import 'package:teni_video_call_demo/feature/video_calling/domain/entities/video_calling_parsing_model.dart';
import 'package:livekit_components/livekit_components.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../login/presentation/screen/widget/custom_draggable_bottom_sheet.dart'
    show CustomDraggableBottomSheet;

class VideoCallingScreen extends StatefulWidget {
  final VideoCallingParsingModel videoCallingParsingModel;
  const VideoCallingScreen({super.key, required this.videoCallingParsingModel});

  @override
  State<VideoCallingScreen> createState() => _VideoCallingScreenState();
}

class _VideoCallingScreenState extends State<VideoCallingScreen> {
  bool showOverlay = true;

  @override
  void initState() {
    if (kDebugMode) {
      log(
        'VideoCallingParsingModel: ${widget.videoCallingParsingModel.toJson()}',
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double iconSizee = 42.w;
    double horizontalPadding = 10.w;
    double veriticalPadding = 8.h;
    double betweenPaddingButtons = 14.w;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xFF212121)),
        child: BlocConsumer<VideoCallingBloc, VideoCallingState>(
          listener: (BuildContext context, VideoCallingState state) {},
          builder: (BuildContext context, VideoCallingState state) {
            return LivekitRoom(
              roomContext: RoomContext(
                url: widget.videoCallingParsingModel.serverUrl,
                token: widget.videoCallingParsingModel.token,
                onConnected: () {
                  if (kDebugMode) {
                    print('LivekitRoom Connected to room');
                  }
                },
                onDisconnected: () {
                  if (kDebugMode) {
                    print('LivekitRoom Disconnected from room');
                  }
                },
                onError: (error) {
                  print('LivekitRoom Error: $error');
                  if (error?.message?.contains('expired') ?? false) {
                    print('LivekitRoom rror?.message: contains expired');
                    // Navigator.pushAndRemoveUntil(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => LoginScreen()),
                    //   (route) => false,
                    // );
                    context.goNamed(RouteNames.login);
                  } else {
                    print(
                      'LivekitRoom rror?.message: does not contain expired',
                    );
                  }
                },
              ),
              builder: (context, roomCtx) {
                var deviceScreenType = getDeviceType(
                  MediaQuery.of(context).size,
                );
                bool isConnected = roomCtx.connected;
                bool isConnecting = roomCtx.connecting;
                bool isNotConnected = !isConnected && !isConnecting;
                if (kDebugMode) {
                  log('LivekitRoom isNotConnected: $isNotConnected ');
                  log('LivekitRoom isConnected: $isConnected');
                  log('LivekitRoom isConnecting: $isConnecting');
                }
                if (isNotConnected) {
                  return Prejoin(
                    horizontalScreenPadding: 16.w,
                    verticalScreenPadding: 0.h,
                    screenBorderRadius: 12,
                    iconSize: iconSizee,
                    veriticalPadding: veriticalPadding,
                    horizontalPadding: horizontalPadding,
                    betweenPaddingButtons: betweenPaddingButtons,
                    borderRadius: 50.r,
                    token: widget.videoCallingParsingModel.token,
                    url: widget.videoCallingParsingModel.serverUrl,
                    onJoinPressed: (roomCtx, url, token) {
                      roomCtx.connect(url: url, token: token);
                    },
                  );
                } else if (isConnected) {
                  return Stack(
                    children: [
                      SafeArea(
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                /// show chat widget on mobile
                                (deviceScreenType == DeviceScreenType.mobile &&
                                        roomCtx.isChatEnabled)
                                    ? Expanded(
                                        child: SafeArea(
                                          bottom: true,
                                          top: true,
                                          child: ChatBuilder(
                                            builder:
                                                (
                                                  context,
                                                  enabled,
                                                  chatCtx,
                                                  messages,
                                                ) {
                                                  return ChatWidget(
                                                    messages: messages,
                                                    onSend: (message) => chatCtx
                                                        .sendMessage(message),
                                                    onClose: () {
                                                      chatCtx.toggleChat(false);
                                                    },
                                                  );
                                                },
                                          ),
                                        ),
                                      )
                                    : Expanded(
                                        flex: 6,
                                        child: Stack(
                                          children: <Widget>[
                                            /* Expanded(
                                            child: TranscriptionBuilder(
                                              builder:
                                                  (context, roomCtx, transcriptions) {
                                                return TranscriptionWidget(
                                                  transcriptions: transcriptions,
                                                );
                                              },
                                            ),
                                          ),*/
                                            /// show participant loop
                                            ParticipantLoop(
                                              showAudioTracks: false,
                                              showVideoTracks: true,
                                              showParticipantPlaceholder: true,

                                              /// layout builder
                                              layoutBuilder:
                                                  roomCtx
                                                      .pinnedTracks
                                                      .isNotEmpty
                                                  ? const CarouselLayoutBuilder()
                                                  : const GridLayoutBuilder(),

                                              /// participant builder
                                              participantTrackBuilder: (context, identifier) {
                                                // build participant widget for each Track
                                                return Padding(
                                                  padding: const EdgeInsets.all(
                                                    2.0,
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      /// video track widget in the background
                                                      identifier.isAudio &&
                                                              roomCtx
                                                                  .enableAudioVisulizer
                                                          ? const AudioVisualizerWidget(
                                                              backgroundColor:
                                                                  LKColors
                                                                      .lkDarkBlue,
                                                            )
                                                          : IsSpeakingIndicator(
                                                              builder:
                                                                  (
                                                                    context,
                                                                    isSpeaking,
                                                                  ) {
                                                                    return isSpeaking !=
                                                                            null
                                                                        ? IsSpeakingIndicatorWidget(
                                                                            isSpeaking:
                                                                                isSpeaking,
                                                                            child:
                                                                                const VideoTrackWidget(),
                                                                          )
                                                                        : const VideoTrackWidget();
                                                                  },
                                                            ),

                                                      /// focus toggle button at the top right
                                                      const Positioned(
                                                        top: 0,
                                                        right: 0,
                                                        child: FocusToggle(),
                                                      ),

                                                      /// track stats at the top left
                                                      const Positioned(
                                                        top: 8,
                                                        left: 0,
                                                        child:
                                                            TrackStatsWidget(),
                                                      ),

                                                      /// status bar at the bottom
                                                      const Positioned(
                                                        bottom: 0,
                                                        left: 0,
                                                        right: 0,
                                                        child:
                                                            ParticipantStatusBar(),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),

                                            /// show control bar at the bottom
                                            Positioned(
                                              bottom: 10.h,
                                              left: 0,
                                              right: 0,
                                              child: SafeArea(
                                                bottom: true,
                                                child: ControlBar(
                                                  microphone: true,
                                                  onHandRaseTap: () {
                                                    log('onHandRaseTap');
                                                  },
                                                  onShareTap: () {
                                                    log('onShareTap');
                                                  },
                                                  iconSize: iconSizee,
                                                  horizontalPadding:
                                                      horizontalPadding,
                                                  veriticalPadding:
                                                      veriticalPadding,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                /// show chat widget on desktop
                                (deviceScreenType != DeviceScreenType.mobile &&
                                        roomCtx.isChatEnabled)
                                    ? Expanded(
                                        flex: 2,
                                        child: SizedBox(
                                          width: 400,
                                          child: ChatBuilder(
                                            builder:
                                                (
                                                  context,
                                                  enabled,
                                                  chatCtx,
                                                  messages,
                                                ) {
                                                  return ChatWidget(
                                                    messages: messages,
                                                    onSend: (message) => chatCtx
                                                        .sendMessage(message),
                                                    onClose: () {
                                                      chatCtx.toggleChat(false);
                                                    },
                                                  );
                                                },
                                          ),
                                        ),
                                      )
                                    : const SizedBox(width: 0, height: 0),
                              ],
                            ),

                            /// show toast widget
                            const Positioned(
                              top: 30,
                              left: 0,
                              right: 0,
                              child: ToastWidget(),
                            ),
                          ],
                        ),
                      ),

                      if (showOverlay)
                        Positioned(
                          left: 0,
                          right: 0,
                          top:
                              0, // Add top constraint to provide bounded height
                          bottom: 0,
                          child: Container(
                            child: CustomDraggableBottomSheet(
                              onDismiss: hideOverlay,
                              bottomControllerWidget: ControlBar(
                                microphone: true,
                                onHandRaseTap: () {
                                  log('onHandRaseTap');
                                },
                                onShareTap: () {
                                  log('onShareTap');
                                },
                                iconSize: iconSizee,
                                horizontalPadding: horizontalPadding,
                                veriticalPadding: veriticalPadding,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                } else {
                  return Center(
                    child: Column(
                      children: [Center(child: Text('Video Calling'))],
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }

  void hideOverlay() {
    setState(() {
      showOverlay = false;
    });
  }
}
