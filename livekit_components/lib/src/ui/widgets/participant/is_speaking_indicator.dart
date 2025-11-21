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

import '../theme.dart';

// class IsSpeakingIndicatorWidget extends StatelessWidget {
//   const IsSpeakingIndicatorWidget({
//     Key? key,
//     required this.isSpeaking,
//     required this.child,
//     this.borderColor = LKColors.lkBlue,
//   }) : super(key: key);

//   final bool isSpeaking;
//   final Widget child;
//   final Color borderColor;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       foregroundDecoration: BoxDecoration(
//         border: isSpeaking
//             ? Border.all(
//                 width: 3,
//                 color: borderColor,
//               )
//             : null,
//       ),
//       child: child,
//     );
//   }
// }

class IsSpeakingIndicatorWidget extends StatelessWidget {
  IsSpeakingIndicatorWidget({
    Key? key,
    this.borderWidth = 3,
    this.borderRadius = 10,
    this.borderGradient,
    required this.isSpeaking,
    required this.child,
    this.borderColor = LKColors.lkBlue,
  }) : super(key: key);
  final bool isSpeaking;
  final double borderWidth;
  final double borderRadius;
  final Widget child;
  final Color borderColor;
  final LinearGradient? borderGradient;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: borderGradient,
        color: borderGradient != null ? borderColor : null,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: EdgeInsets.all(!isSpeaking ? 0 : borderWidth),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: child,
        ),
      ),
    );
  }
}
