import 'package:math_expressions/math_expressions.dart';

import 'info.dart';

bool specialOperators(String x) {
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

void equalPressed() {
  String finalQuestion = userQuestion;
  finalQuestion = finalQuestion.replaceAll('×', '*');
  finalQuestion = finalQuestion.replaceAll('÷', '/');

  Parser p = Parser();
  Expression exp = p.parse(finalQuestion);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);

  userAnswer = eval.toString();
}
