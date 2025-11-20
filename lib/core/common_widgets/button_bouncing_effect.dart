import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teni_video_call_demo/core/theme/color_schemes.dart';

class ButtonBouncingEffect extends StatefulWidget {
  const ButtonBouncingEffect({
    super.key,
    this.onTap,
    this.fromSettingScreen = false,
    this.withSoundEffect = true,
    this.isLoading = false,
    required this.buttonText,
  });

  final String buttonText;
  final VoidCallback? onTap;
  final bool fromSettingScreen;
  final bool withSoundEffect;
  final bool isLoading;

  @override
  State<ButtonBouncingEffect> createState() => _ButtonBouncingEffectState();
}

class _ButtonBouncingEffectState extends State<ButtonBouncingEffect> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() => _scale = 0.95);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _scale = 1.0);
  }

  void _onTapCancel() {
    setState(() => _scale = 1.0);
  }

  void _onDoubleTap() {
    setState(() => _scale = 1.0);
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return GestureDetector(
      onDoubleTap: _onDoubleTap,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 150),
        child: Material(
          color: Colors.transparent, // Keep ripple visible over background
          child: InkWell(
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            onTap: widget.onTap,
            onTapDown: _onTapDown,
            onTapUp: _onTapUp,
            onTapCancel: _onTapCancel,

            borderRadius: BorderRadius.circular(100), // If circular
            child: Container(
              width: double.infinity,
              height: 40.h,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (widget.isLoading)
                    Container(
                      margin: EdgeInsets.only(right: 15.w),
                      width: 20.w,
                      height: 20.w,
                      child: CircularProgressIndicator(
                        color: AppColorSchemes.whiteColor,
                      ),
                    ),
                  Text(
                    widget.buttonText,
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future giveHapticFeedback({bool twoTimes = false}) async {
  return;
}
