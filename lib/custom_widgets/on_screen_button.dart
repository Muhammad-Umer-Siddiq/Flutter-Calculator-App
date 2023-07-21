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
      this.buttonTap,
        this.buttonText,
      this.textSize = 27});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTap,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Container(
            alignment: Alignment.center,
            color: buttonColor,
            child: Text(
              buttonText!,
              style: TextStyle(fontSize: textSize, color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
