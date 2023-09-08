import 'package:math_expressions/math_expressions.dart';

import 'values.dart';

class CalculatorHelpers {
  static bool specialOperators(String x) {
    if (x == '÷' ||
        x == '×' ||
        x == '-' ||
        x == '+' ||
        x == '.' ||
        x == ')' ||
        x == '(') {
      return true;
    } else {
      return false;
    }
  }

  static void equalPressed() {
    String finalQuestion = AppValues.userQuestion;
    finalQuestion = finalQuestion.replaceAll('×', '*');
    finalQuestion = finalQuestion.replaceAll('÷', '/');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    AppValues.userAnswer = eval.toString();
  }
}
