import '../../utilities/imports.dart';

class ButtonTile extends StatelessWidget {
  final Color? textColor;
  final Color? buttonColor;
  final String? buttonText;
  final double? textSize;
  final VoidCallback? buttonSingleTap;
  final VoidCallback? buttonLongPress;
  const ButtonTile(
      {super.key,
      this.textColor,
      this.buttonColor,
      this.buttonSingleTap,
      this.buttonText,
      this.buttonLongPress,
      this.textSize = 27});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: buttonLongPress,
      onTap: buttonSingleTap,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Container(
            alignment: Alignment.center,
            color: buttonColor ?? AppColors.defaultOperatorButtonColor,
            child: Text(
              buttonText!,
              style: TextStyle(
                  fontSize: textSize,
                  color: textColor ?? AppColors.defaultOperatorTextColor),
            ),
          ),
        ),
      ),
    );
  }
}
