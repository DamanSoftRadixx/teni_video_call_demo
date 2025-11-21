// Copyright 2024 LiveKit, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:livekit_components/livekit_components.dart';

import 'package:provider/provider.dart';

import '../../context/room_context.dart';
import '../../debug/logger.dart';
import '../builder/camera_preview.dart';
import '../builder/room/join_button.dart';
import '../widgets/camera_preview.dart';
import '../widgets/room/camera_select_button.dart';
import '../widgets/room/join_button.dart';
import '../widgets/room/microphone_select_button.dart';
import '../builder/room/camera_switch.dart';

class Prejoin extends StatelessWidget {
  Widget? customStartButton;
  double? iconSize;
  double? veriticalPadding;
  double? horizontalPadding;
  double? betweenPaddingButtons;
  double? borderRadius;
  double? horizontalScreenPadding;
  double? verticalScreenPadding;
  double? screenBorderRadius;
  Widget? emptyWidget;

  Prejoin(
      {super.key,
      required this.token,
      required this.url,
      this.iconSize,
      this.veriticalPadding,
      this.horizontalPadding,
      this.betweenPaddingButtons,
      this.horizontalScreenPadding,
      this.verticalScreenPadding,
      this.screenBorderRadius,
      this.borderRadius,
      this.onJoinPressed,
      this.customStartButton,
      this.emptyWidget});

  final Function(RoomContext roomCtx, String url, String token)? onJoinPressed;

  String token;

  String url;

  void onTextTokenChanged(String token) async {
    this.token = token;
  }

  void onTextUrlChanged(String url) async {
    this.url = url;
  }

  void _handleJoinPressed(RoomContext roomCtx) async {
    if (onJoinPressed == null) {
      Debug.event('Joining room: $url');
      try {
        await roomCtx.connect(
          url: url,
          token: token,
        );
      } catch (e) {
        Debug.event('Failed to join room: $e');
      }
      return;
    }
    onJoinPressed?.call(roomCtx, url, token);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RoomContext>(
      builder: (context, roomCtx, child) {
        return Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: horizontalScreenPadding ?? 16,
                vertical: verticalScreenPadding ?? 0.0),
            decoration: BoxDecoration(color: Color(0xFF212121)),
            child: SafeArea(
              bottom: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // if (roomCtx.connected) const ClearPinButton(),
                  Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Icon(
                            Icons.clear,
                            size: ((iconSize ?? 20) / 1.5),
                            color: Colors.white,
                          ),
                        ),
                      )),
                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(screenBorderRadius ?? 12),
                      child: Stack(
                        alignment: Alignment.center,
                        fit: StackFit.expand,
                        children: [
                          MediaDeviceSelectButton(
                              builder: (context, roomCtx, deviceCtxs) {
                            return CameraPreview(
                              builder: (context, videoTrack) =>
                                  CameraPreviewWidgetCustom(
                                onDoubleTap: () async {
                                  // deviceCtx.toggleCameraPosition();
                                  // bool isCameraOn = deviceCtx.cameraOpened;
                                  // if (isCameraOn) {
                                  //   deviceCtx.disableCamera();
                                  // } else {
                                  //   deviceCtx.enableCamera();
                                  // }
                                  // print('onDoubleTap emptyWidget');
                                  // deviceCtx.toggleCameraPosition();
                                  // print(
                                  //     'toggleCameraPosition: ${deviceCtx.currentPosition}');
                                  // Only act when we actually have a preview track
                                  // if (videoTrack == null || position == null) {
                                  //   debugPrint(
                                  //       'onDoubleTap: no preview track, showing emptyWidget');
                                  //   return;
                                  // }

                                  // final newPosition =
                                  //     position == CameraPosition.front
                                  //         ? CameraPosition.back
                                  //         : CameraPosition.front;

                                  // await videoTrack
                                  //     .setCameraPosition(newPosition);

                                  // if (deviceCtxs.cameraOpened) {
                                  //   deviceCtxs.enableCamera();
                                  // } else {
                                  //   deviceCtxs.disableCamera();
                                  // }
                                  String selectedDegiceId =
                                      deviceCtxs.selectedVideoInputDeviceId ??
                                          '';
                                  List<MediaDevice>? deviceList =
                                      deviceCtxs.videoInputs ?? [];
                                  if (selectedDegiceId.isEmpty &&
                                      deviceList.isNotEmpty) {
                                    deviceCtxs
                                        .selectVideoInput(deviceList.first);
                                    print(
                                        'selected device: ${deviceList.first.deviceId}');
                                  } else if (selectedDegiceId.isNotEmpty &&
                                      deviceList.length > 1) {
                                    var oppositeDevice = deviceList.firstWhere(
                                        (element) =>
                                            element.deviceId !=
                                            selectedDegiceId);
                                    deviceCtxs.selectVideoInput(oppositeDevice);
                                    print(
                                        'selected device: ${oppositeDevice.deviceId}');
                                  } else {
                                    print('no device to select');
                                  }
                                },
                                track: videoTrack,
                                emptyWidget: emptyWidget ?? Container(),
                                backgroundColor: Colors.black,
                                borderRadius: 12,
                              ),
                            );
                          }),
                          Positioned(
                            bottom: 20,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: horizontalPadding ?? 10.0,
                                  vertical: veriticalPadding ?? 8.0),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.4),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MicrophoneSelectButton(
                                    iconSize: iconSize ?? 42,
                                  ),
                                  SizedBox(width: betweenPaddingButtons ?? 18),
                                  CameraSelectButton(
                                    showTitleWidget: true,
                                    iconSize: iconSize ?? 42,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 360,
                  //   child: Container(
                  //       padding: const EdgeInsets.symmetric(
                  //           horizontal: 0.0, vertical: 16.0),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           MicrophoneSelectButton(
                  //             iconSize: iconSize,
                  //           ),
                  //           CameraSelectButton(
                  //             iconSize: iconSize,
                  //             showTitleWidget: true,
                  //           ),
                  //         ],
                  //       )),
                  // ),
                  // SizedBox(
                  //   width: 360,
                  //   child: Container(
                  //     padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  //     child: TextInput(
                  //       onTextChanged: onTextUrlChanged,
                  //       hintText: 'Enter Livekit Server URL',
                  //       text: url,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 360,
                  //   child: Container(
                  //     padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  //     child: TextInput(
                  //       onTextChanged: onTextTokenChanged,
                  //       hintText: 'Enter Token',
                  //       text: token,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 15),
                  customStartButton != null
                      ? (InkWell(
                          onTap: () => _handleJoinPressed(roomCtx),
                          child: customStartButton))
                      : SizedBox(
                          width: 360,
                          height: 64,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: JoinButton(
                              builder: (context, roomCtx, connected) =>
                                  JoinButtonWidget(
                                roomCtx: roomCtx,
                                connected: connected,
                                onPressed: () => _handleJoinPressed(roomCtx),
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
