import 'package:flutter/material.dart';

import '../app_assets/app_colors.dart';
import '../app_assets/app_functions.dart';
import '../app_assets/info.dart';
import '../custom_widgets/custom_containers.dart';
import '../custom_widgets/on_screen_button.dart';

class CalculatorMainScreen extends StatefulWidget {
  const CalculatorMainScreen({super.key});

  @override
  State<CalculatorMainScreen> createState() => _CalculatorMainScreenState();
}

class _CalculatorMainScreenState extends State<CalculatorMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          Flexible(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 36),
              CustomContainer(
                insideText: userQuestion,
              ),
              CustomContainer(
                  childAlignment: Alignment.centerRight,
                  insideText: userAnswer,
                  topPadding: 1,
                  textSize: 50),
            ],
          )),
          Expanded(
            flex: 2,
            child: SizedBox(
              child: GridView.builder(
                itemCount: screenButtons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: buttonSize, crossAxisCount: totalButtons),
                itemBuilder: (context, index) {
                  // Clear Button
                  if (index == 0) {
                    return OnScreenButton(
                      buttonTap: () {
                        setState(() {
                          userQuestion = '';
                          userAnswer = '';
                        });
                      },
                      buttonText: screenButtons[index],
                      buttonColor: clearButtonColor,
                    );
                  }
                  // Delete Button
                  else if (index == 1) {
                    return OnScreenButton(
                      buttonTap: () {
                        setState(() {
                          userQuestion = userQuestion.substring(
                              0, userQuestion.length - 1);
                        });
                      },
                      buttonText: screenButtons[index],
                      buttonColor: deleteButtonColor,
                    );
                  }
                  // Equals to Button
                  else if (index == screenButtons.length - 3) {
                    return OnScreenButton(
                      buttonTap: () {
                        setState(() {
                          equalPressed();
                        });
                      },
                      textSize: 40,
                      textColor: Colors.black,
                      buttonText: screenButtons[index],
                      buttonColor: Colors.white70,
                    );
                  }

                  // Rest Buttons
                  else {
                    return OnScreenButton(
                      buttonTap: () {
                        setState(() {
                          userQuestion += screenButtons[index];
                        });
                      },
                      buttonText: screenButtons[index],
                      textColor: specialOperators(screenButtons[index])
                          ? Colors.white // For special operators
                          : Colors.black,
                      buttonColor: specialOperators(screenButtons[index])
                          ? specialOperatorColor
                          : numbersButtonColor,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
