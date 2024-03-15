import 'dart:developer';

import 'package:calculator/constants/colors.dart';
import 'package:calculator/widgets/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int firstNumber = 0;
  int secondNumber = 0;
  String history = '';
  String textToDisplay = '';
  String result = '';
  String operation = '';

  void onPressed(String buttonValue) {
    log(buttonValue);
    if (buttonValue == 'C') {
      firstNumber = 0;
      secondNumber = 0;
      textToDisplay = '';
      result = '';
    } else if (buttonValue == 'AC') {
      firstNumber = 0;
      secondNumber = 0;
      history = '';
      textToDisplay = '';
      result = '';
    } else if (buttonValue == '+/-') {
      if (textToDisplay[0] != '-') {
        result = '-$textToDisplay';
      } else {
        result = textToDisplay.substring(1);
      }
    } else if (buttonValue == '<') {
      result = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (buttonValue == '+' ||
        buttonValue == '-' ||
        buttonValue == 'X' ||
        buttonValue == '/') {
      log(textToDisplay);
      firstNumber = int.parse(textToDisplay);
      result = '';
      operation = buttonValue;
    } else if (buttonValue == '=') {
      secondNumber = int.parse(textToDisplay);
      if (operation == '+') {
        result = (firstNumber + secondNumber).toString();
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      }
      if (operation == '-') {
        result = (firstNumber - secondNumber).toString();
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      }
      if (operation == 'X') {
        result = (firstNumber * secondNumber).toString();
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      }
      if (operation == '/') {
        if (secondNumber == 0) {
          result = 'Null';
        } else {
          result = (firstNumber / secondNumber).toString();
        }
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      }
    } else {
      result = int.parse(textToDisplay + buttonValue).toString();
    }
    setState(() {
      textToDisplay = result=='Null'?'':result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff28527a),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'CALCULATOR',
          style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 12),
            alignment: const Alignment(1, 1),
            child: Text(
              history,
              style: const TextStyle(color: Color(0x66ffffff), fontSize: 24),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            alignment: const Alignment(1.0, 1.0),
            child: Text(
              textToDisplay,
              style: const TextStyle(color: Colors.white, fontSize: 48),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                  buttonContent: 'AC',
                  fillColor: numberColor,
                  fontSize: 24,
                  onPressed: onPressed),
              CalculatorButton(
                  buttonContent: 'C',
                  fillColor: numberColor,
                  fontSize: 24,
                  onPressed: onPressed),
              CalculatorButton(
                  buttonContent: '<',
                  fillColor: operationColor,
                  fontSize: 24,
                  onPressed: onPressed),
              CalculatorButton(
                  buttonContent: '/',
                  fillColor: operationColor,
                  fontSize: 24,
                  onPressed: onPressed)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                  buttonContent: '9',
                  fillColor: numberColor,
                  fontSize: 24,
                  onPressed: onPressed),
              CalculatorButton(
                  buttonContent: '8',
                  fillColor: numberColor,
                  fontSize: 24,
                  onPressed: onPressed),
              CalculatorButton(
                  buttonContent: '7',
                  fillColor: numberColor,
                  fontSize: 24,
                  onPressed: onPressed),
              CalculatorButton(
                  buttonContent: 'X',
                  fillColor: operationColor,
                  fontSize: 24,
                  onPressed: onPressed)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                  buttonContent: '6',
                  fillColor: numberColor,
                  fontSize: 24,
                  onPressed: onPressed),
              CalculatorButton(
                  buttonContent: '5',
                  fillColor: numberColor,
                  fontSize: 24,
                  onPressed: onPressed),
              CalculatorButton(
                  buttonContent: '4',
                  fillColor: numberColor,
                  fontSize: 24,
                  onPressed: onPressed),
              CalculatorButton(
                  buttonContent: '-',
                  fillColor: operationColor,
                  fontSize: 36,
                  onPressed: onPressed)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                  buttonContent: '3',
                  fillColor: numberColor,
                  fontSize: 24,
                  onPressed: onPressed),
              CalculatorButton(
                  buttonContent: '2',
                  fillColor: numberColor,
                  fontSize: 24,
                  onPressed: onPressed),
              CalculatorButton(
                  buttonContent: '1',
                  fillColor: numberColor,
                  fontSize: 24,
                  onPressed: onPressed),
              CalculatorButton(
                  buttonContent: '+',
                  fillColor: operationColor,
                  fontSize: 28,
                  onPressed: onPressed)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                  buttonContent: '+/-',
                  fillColor: numberColor,
                  fontSize: 22,
                  onPressed: onPressed),
              CalculatorButton(
                  buttonContent: '0',
                  fillColor: numberColor,
                  fontSize: 24,
                  onPressed: onPressed),
              CalculatorButton(
                  buttonContent: '00',
                  fillColor: numberColor,
                  fontSize: 24,
                  onPressed: onPressed),
              CalculatorButton(
                  buttonContent: '=',
                  fillColor: operationColor,
                  fontSize: 28,
                  onPressed: onPressed)
            ],
          )
        ],
      ),
    );
  }
}
