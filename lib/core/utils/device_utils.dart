import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Enum for navigation bar types
enum NavigationBarType {
  gestureNavigation,
  threeButtonNavigation,
  twoButtonNavigation,
  unknown,
}

class DeviceUtils {
  DeviceUtils._();

  static bool get isAndroid => Platform.isAndroid;
  static bool get isIOS => Platform.isIOS;

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide >= 600;
  }

  static bool isNeedSafeArea(BuildContext context) {
    return MediaQuery.of(context).viewPadding.bottom > 0;
  }

  // New methods for better system UI detection
  static bool hasBottomNavBar(BuildContext context) {
    return MediaQuery.of(context).viewPadding.bottom > 0;
  }

  static bool hasTopNotch(BuildContext context) {
    return MediaQuery.of(context).viewPadding.top > 0;
  }

  static EdgeInsets getSystemPadding(BuildContext context) {
    return MediaQuery.of(context).viewPadding;
  }

  // System UI configuration methods
  static void configureSystemUIForGame() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    // Hide all overlays
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    return;
    // if (isAndroid) {
    //   SystemChrome.setSystemUIOverlayStyle(
    //     const SystemUiOverlayStyle(
    //       statusBarColor: Colors.transparent,
    //       statusBarIconBrightness: Brightness.light,
    //       systemNavigationBarColor: Colors.transparent,
    //       systemNavigationBarIconBrightness: Brightness.light,
    //     ),
    //   );

    //   // Enable edge-to-edge mode but keep navigation bar visible
    //   // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    // } else if (isIOS) {
    //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    // }
  }
}
