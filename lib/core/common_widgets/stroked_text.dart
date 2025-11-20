import 'package:flutter/material.dart';

class StrokedText extends StatelessWidget {
  final String text;
  final Color strokeColor;
  final TextStyle? style;
  final double strokeWidth;

  const StrokedText({
    super.key,
    required this.text,
    required this.strokeColor,
    this.style,
    this.strokeWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Stroke layer
        Text(
          text,
          style: TextStyle(
            fontSize: style?.fontSize,
            fontWeight: style?.fontWeight,
            fontFamily: style?.fontFamily,
            height: style?.height,
            letterSpacing: style?.letterSpacing,
            foreground:
                Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = strokeWidth
                  ..color = strokeColor,
          ),
        ),
        // Fill layer
        Text(text, style: style),
      ],
    );
  }
}
