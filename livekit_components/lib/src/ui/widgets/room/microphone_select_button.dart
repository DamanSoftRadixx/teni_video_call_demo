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

import '../../builder/room/media_device_select_button.dart';
import '../theme.dart';
import 'media_device_select_button.dart';

class MicrophoneSelectButton extends StatelessWidget {
  const MicrophoneSelectButton({
    super.key,
    this.iconSize,
    this.showtitleWidget = true,
    this.titleWidget,
    this.color = Colors.grey,
    this.selectedColor = LKColors.lkBlue,
    this.iconColor = Colors.white,
    this.foregroundColor = Colors.white,
    this.selectedOverlayColor = LKColors.lkLightBlue,
  });

  final double? iconSize;
  final bool showtitleWidget;
  final Widget? titleWidget;
  final Color color;
  final Color selectedColor;
  final Color iconColor;
  final Color foregroundColor;
  final Color selectedOverlayColor;

  @override
  Widget build(BuildContext context) {
    return MediaDeviceSelectButton(builder: (context, roomCtx, deviceCtx) {
      return MediaDeviceSelectWidget(
        iconSize: iconSize ?? 40,
        isCustomIcon: true,
        selectedIcon: 'assets/svg/mic_ic.svg',
        unselectedIcon: 'assets/svg/mic_off_ic.svg',
        titleWidget: titleWidget ??
            Text(
              'Microphone',
              style: TextStyle(fontSize: 14, color: iconColor),
            ),
        backgroundColor: color,
        selectedColor: selectedColor,
        foregroundColor: foregroundColor,
        selectedOverlayColor: selectedOverlayColor,
        iconColor: iconColor,
        iconOn: Icons.mic,
        iconOff: Icons.mic_off,
        deviceList: deviceCtx.audioInputs ?? [],
        selectedDeviceId: deviceCtx.selectedAudioInputDeviceId,
        deviceIsOpened: deviceCtx.microphoneOpened,
        onSelect: (device) => deviceCtx.selectAudioInput(device),
        onToggle: (enabled) => enabled
            ? deviceCtx.enableMicrophone()
            : deviceCtx.disableMicrophone(),
        showTitleWidget: showtitleWidget,
      );
    });
  }
}
