// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class CustomText extends StatefulWidget {
  const CustomText({
    Key? key,
    this.width,
    this.height,
    this.text1,
    required this.text2,
    required this.color,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? text1;
  final String text2;
  final Color color;

  @override
  _CustomTextState createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      body: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: widget.text1,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xFFD9DCDE),
              ),
              children: <TextSpan>[
                TextSpan(
                  text: widget.text2,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFFD9DCDE),
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed,
                    decorationColor: Color(0xFFD9DCDE),
                    decorationThickness: 0.5,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
