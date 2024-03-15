import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String buttonContent;
  final Color fillColor;
  final double fontSize;
  final Function onPressed;
  const CalculatorButton(
      {required this.buttonContent,
      required this.fillColor,
      required this.fontSize,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 70,
      width: 70,
      child: MaterialButton(
        onPressed: () {
          onPressed(buttonContent);
        },
        color: fillColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Text(
          buttonContent,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
