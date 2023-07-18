import 'package:flutter/material.dart';

class OnScreenButton extends StatelessWidget {
  final Color textColor;
  final Color buttonColor;
  final String? buttonText;
  final double textSize;
  final VoidCallback? buttonTap;
  const OnScreenButton(
      {super.key,
      this.textColor = Colors.white,
      this.buttonColor = Colors.white24,
      this.buttonText,
      this.buttonTap,
      this.textSize = 26});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: Container(
          alignment: Alignment.center,
          color: buttonColor,
          child: Text(
            buttonText!,
            style: TextStyle(fontSize: textSize, color: textColor),
          ),
        ),
      ),
    );
  }
}
