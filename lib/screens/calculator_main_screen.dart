import '../utilities/imports.dart';

class CalculatorMainScreen extends StatefulWidget {
  const CalculatorMainScreen({super.key});

  @override
  State<CalculatorMainScreen> createState() => _CalculatorMainScreenState();
}

class _CalculatorMainScreenState extends State<CalculatorMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          Flexible(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 36),
              CustomContainer(insideText: AppValues.userQuestion),
              CustomContainer(
                  childAlignment: Alignment.centerRight,
                  insideText: AppValues.userAnswer,
                  topPadding: 1,
                  textSize: 50),
            ],
          )),
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: AppValues.screenButtons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: AppValues.buttonSize,
                  crossAxisCount: AppValues.totalButtons),
              itemBuilder: (context, index) {
                // Clear Button
                if (AppValues.screenButtons[index] == 'C') {
                  return ButtonTile(
                    buttonSingleTap: () => setState(() {
                      AppValues.userQuestion = '';
                      AppValues.userAnswer = '';
                    }),
                    buttonText: AppValues.screenButtons[index],
                    buttonColor: AppColors.clearButtonColor,
                  );
                }

                // Delete Button
                else if (AppValues.screenButtons[index] == 'DEL') {
                  return ButtonTile(
                    buttonLongPress: () => setState(() {
                      AppValues.userQuestion = '';
                      AppValues.userAnswer = '0';
                    }),
                    buttonSingleTap: () => setState(() {
                      AppValues.userQuestion = AppValues.userQuestion
                          .substring(0, AppValues.userQuestion.length - 1);
                    }),
                    buttonText: AppValues.screenButtons[index],
                    buttonColor: AppColors.deleteButtonColor,
                  );
                }

                // Equals to Button
                else if (AppValues.screenButtons[index] == '=') {
                  return ButtonTile(
                    buttonSingleTap: () =>
                        setState(() => CalculatorHelpers.equalPressed()),
                    textSize: 40,
                    textColor: AppColors.equalsTextColor,
                    buttonText: AppValues.screenButtons[index],
                    buttonColor: AppColors.equalsButtonColor,
                  );
                }

                // Number Buttons
                else {
                  return ButtonTile(
                    buttonSingleTap: () => setState(() {
                      AppValues.userQuestion += AppValues.screenButtons[index];
                    }),
                    buttonText: AppValues.screenButtons[index],
                    textColor: CalculatorHelpers.specialOperators(
                            AppValues.screenButtons[index])
                        ? AppColors
                            .specialOperatorTextColor // For special operators
                        : AppColors.numbersTextColor,
                    buttonColor: CalculatorHelpers.specialOperators(
                            AppValues.screenButtons[index])
                        ? AppColors.specialOperatorButtonColor
                        : AppColors.numbersButtonColor,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
