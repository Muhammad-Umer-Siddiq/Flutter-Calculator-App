import 'package:flutter/material.dart';

import '../app_assets/colors.dart';
import '../app_assets/functions.dart';
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
          Expanded(
              child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CustomContainer(
                  childAlignment: Alignment.topRight,
                  childWidget: Icon(
                    Icons.currency_exchange,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                CustomContainer(insideText: userQuestion),
                CustomContainer(
                  childAlignment: Alignment.centerRight,
                  insideText: userAnswer,
                  textSize: 45,
                )
              ],
            ),
          )),
          Expanded(
            flex: 2,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8, bottom: 8),
                child: GridView.builder(
                  itemCount: screenButtons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 18,
                      mainAxisExtent: buttonSize,
                      crossAxisCount: totalButtons),
                  itemBuilder: (context, index) {
                    // Clear Button
                    if (index == 0) {
                      return OnScreenButton(
                        buttonTap: () {
                          setState(() {
                            userQuestion = '';
                          });
                        },
                        buttonText: screenButtons[index],
                        buttonColor: Colors.red.shade800,
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
                        buttonColor: Colors.blue.shade800,
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
                        textSize: 34,
                        buttonText: screenButtons[index],
                        buttonColor: Colors.white24,
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
                            ? Colors.white24
                            : Colors.white70,
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
