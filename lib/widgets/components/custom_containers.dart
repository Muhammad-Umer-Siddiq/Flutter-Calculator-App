import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Alignment? childAlignment;
  final Widget? childWidget;
  final String? insideText;
  final Color textColor;
  final double textSize;
  final double topPadding;
  final double? bottomPadding;
  final double rightPadding;
  final double leftPadding;

  const CustomContainer({
    super.key,
    this.childAlignment,
    this.childWidget,
    this.insideText,
    this.textColor = Colors.white,
    this.textSize = 35,
    this.topPadding = 16,
    this.bottomPadding,
    this.leftPadding = 16,
    this.rightPadding = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: topPadding ,
          bottom: bottomPadding??1,
          right: rightPadding,
          left: leftPadding),
      alignment: childAlignment ?? Alignment.centerLeft,
      child: childWidget ??
          Text(
            insideText!,
            style: TextStyle(color: textColor, fontSize: textSize),
          ),
    );
  }
}
