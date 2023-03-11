import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CLickAbleText extends StatelessWidget {
  final String unclick;
  final String click;
  final VoidCallback clickFunction;
  const CLickAbleText(
      {super.key,
      required this.unclick,
      required this.click,
      required this.clickFunction});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: unclick,
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
              text: click,
               style: const TextStyle(fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()..onTap = () => clickFunction),
        ],
      ),
    );
  }
}
