// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:flutter/material.dart';

class CustomTimer extends StatefulWidget {
  const CustomTimer({
    Key? key,
    this.width,
    this.height,
    required this.date,
    required this.color,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DateTime date;
  final Color color;

  @override
  _CustomTimerState createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {
  int? difference;
  int? differenceDays;
  String? time;
  String? timeDays;
  bool isTrue = false;

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(
        from.year, from.month, from.day, from.hour, from.minute, from.second);
    to = DateTime(to.year, to.month, to.day, to.hour, to.minute, to.second);
    return (to.difference(from).inSeconds).round();
  }

  int days(DateTime from, DateTime to) {
    from = DateTime(
        from.year, from.month, from.day, from.hour, from.minute, from.second);
    to = DateTime(to.year, to.month, to.day, to.hour, to.minute, to.second);
    return (to.difference(from).inDays).round();
  }

  String intToTimeLeft(int value) {
    int h, m, s;

    h = value ~/ 3600;

    m = ((value - h * 3600)) ~/ 60;

    s = value - (h * 3600) - (m * 60);

    String hourLeft = h.toString().length < 2 ? "0$h" : h.toString();

    String minuteLeft = m.toString().length < 2 ? "0$m" : m.toString();

    String secondsLeft = s.toString().length < 2 ? "0$s" : s.toString();

    String result = "$hourLeft:$minuteLeft:$secondsLeft";

    return result;
  }

  void _countTime() {
    Timer.periodic(
      const Duration(seconds: 1),
      ((timer) {
        DateTime now = DateTime.now();
        if (now.compareTo(widget.date) < 0) {
          difference = daysBetween(now, widget.date);
          differenceDays = days(now, widget.date);
          time = intToTimeLeft(difference!);
        } else {
          difference = daysBetween(now, widget.date);
          differenceDays = days(now, widget.date);
          time = intToTimeLeft(difference!);
          isTrue = true;
          timer.cancel();
        }
        setState(() {});
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    _countTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: differenceDays! < 1 ? false : true,
              child: Text(
                '$differenceDays${differenceDays! <= 1 ? ' DAY' : ' DAYS'}',
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Metal', 
                  color: Color(0xFFF4472B),
                ),
              ),
            ),
            time == null
                ? CircularProgressIndicator()
                : Text(
                    isTrue ? 'READY TO BEGIN' : time!,
                    textAlign: TextAlign.center,
                    style: isTrue
                        ? const TextStyle(
                            fontSize: 39,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Metal',
                            color: Color(0xFFF4472B),
                          )
                        : const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Metal',
                            color: Color(0xFFF4472B),
                          ),
                  ),
          ],
        ),
      ),
    );
  }
}
