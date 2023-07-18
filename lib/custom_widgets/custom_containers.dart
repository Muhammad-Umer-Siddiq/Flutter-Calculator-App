import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Alignment? childAlignment;
  final Widget? childWidget;
  final String? insideText;
  final Color textColor;
  final double textSize;
  const CustomContainer({
    super.key,
    this.childAlignment,
    this.childWidget,
    this.insideText,
    this.textColor = Colors.white,
    this.textSize = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: childAlignment ?? Alignment.centerLeft,
      child: childWidget ??
          Text(
            insideText!,
            style: TextStyle(color: textColor, fontSize: textSize),
          ),
    );
  }
}
