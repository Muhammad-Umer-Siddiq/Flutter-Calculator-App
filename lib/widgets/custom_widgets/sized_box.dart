import 'package:calculator_app/utilities/imports.dart';

class CustomSizedBox extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;

  const CustomSizedBox({this.child, this.height, this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSizedBox(
      height: height,
      width: width,
      child: child,
    );
  }
}
