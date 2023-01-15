import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../instructions010_copy/instructions010_copy_widget.dart';
import '../trip1/trip1_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pinput/pinput.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  bool _isValid = false;
  bool wrongAnswer = false;

  @override
  void initState() {
    super.initState();
    pinController.addListener(() {
      setState(() {
        _isValid = pinController.text.length == 6;
        if (!_isValid) {
          wrongAnswer = false;
        }
      });
    });
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF002532),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(focusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    (MediaQuery.of(context).size.width * 16) / 390,
                    (MediaQuery.of(context).size.height * 1) / 797,
                    (MediaQuery.of(context).size.width * 16) / 390,
                    0),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: (MediaQuery.of(context).size.width * 358) / 390,
                  height: (MediaQuery.of(context).size.height * 76) / 797,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    (MediaQuery.of(context).size.width * 77) / 390,
                    (MediaQuery.of(context).size.height * 32) / 797,
                    (MediaQuery.of(context).size.width * 77) / 390,
                    0),
                child: Container(
                  width: (MediaQuery.of(context).size.width * 236) / 390,
                  height: (MediaQuery.of(context).size.height * 151) / 797,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: wrongAnswer,
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'Извините, но такого номера бронирования не существует' /* Sorry, but there is no such booking number */,
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                                fontSize: (MediaQuery.of(context).size.height *
                                                14) /
                                            797 >
                                        (MediaQuery.of(context).size.width *
                                                14) /
                                            390
                                    ? (MediaQuery.of(context).size.width * 14) /
                                        390
                                    : (MediaQuery.of(context).size.height *
                                            14) /
                                        797,
                                lineHeight: 18 /
                                    ((MediaQuery.of(context).size.height * 14) /
                                                797 >
                                            (MediaQuery.of(context).size.width *
                                                    14) /
                                                390
                                        ? (MediaQuery.of(context).size.width *
                                                14) /
                                            390
                                        : (MediaQuery.of(context).size.height *
                                                14) /
                                            797),
                                color: Color(0xFFD9DCDE),
                              ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    (MediaQuery.of(context).size.width * 16) / 390,
                    (MediaQuery.of(context).size.height * 33) / 797,
                    (MediaQuery.of(context).size.width * 16) / 390,
                    0),
                child: Container(
                  width: (MediaQuery.of(context).size.width * 358) / 390,
                  height: (MediaQuery.of(context).size.height * 80) / 797,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xFFF4472B),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        (MediaQuery.of(context).size.width * 38) / 390,
                        (MediaQuery.of(context).size.height * 8) / 797,
                        (MediaQuery.of(context).size.width * 38) / 390,
                        (MediaQuery.of(context).size.height * 16) / 797),
                    child: Pinput(
                      length: 6,
                      pinAnimationType: PinAnimationType.slide,
                      controller: pinController,
                      focusNode: focusNode,
                      defaultPinTheme: PinTheme(
                        width: (MediaQuery.of(context).size.width * 40) / 390,
                        height: (MediaQuery.of(context).size.height * 80) / 797,
                        textStyle: TextStyle(
                          fontSize: (MediaQuery.of(context).size.height * 50) /
                                      797 >
                                  (MediaQuery.of(context).size.width * 50) / 390
                              ? (MediaQuery.of(context).size.width * 50) / 390
                              : (MediaQuery.of(context).size.height * 50) / 797,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: wrongAnswer
                              ? Color(0xFFF4472B)
                              : Color(0xFFD9DCDE),
                        ),
                        decoration: BoxDecoration(),
                      ),
                      showCursor: true,
                      cursor: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width:
                                (MediaQuery.of(context).size.width * 22) / 390,
                            height:
                                (MediaQuery.of(context).size.height * 2) / 797,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(217, 220, 222, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                      preFilledWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width:
                                (MediaQuery.of(context).size.width * 22) / 390,
                            height:
                                (MediaQuery.of(context).size.width * 2) / 797,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(217, 220, 222, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0, (MediaQuery.of(context).size.height * 16) / 797, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (pinController.text == FFAppState().pinput.toString()) {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Trip1Widget(),
                        ),
                      );
                    } else {
                      setState(() {
                        wrongAnswer = true;
                      });
                    }
                  },
                  text: FFLocalizations.of(context).getText(
                    '5tzuumc9' /* OK */,
                  ),
                  options: FFButtonOptions(
                    width: (MediaQuery.of(context).size.width * 236) / 390,
                    height: (MediaQuery.of(context).size.height * 48) / 797,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Inter',
                          color:
                              _isValid ? Color(0xFFF4472B) : Color(0xFFA5AAAD),
                          fontSize: (MediaQuery.of(context).size.height * 16) /
                                      797 >
                                  (MediaQuery.of(context).size.width * 16) / 390
                              ? (MediaQuery.of(context).size.width * 16) / 390
                              : (MediaQuery.of(context).size.height * 16) / 797,
                          fontWeight: FontWeight.bold,
                        ),
                    borderSide: BorderSide(
                      color: _isValid ? Color(0xFFF4472B) : Color(0xFFA5AAAD),
                      width: (MediaQuery.of(context).size.width * 1) / 390,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    (MediaQuery.of(context).size.width * 16) / 390,
                    (MediaQuery.of(context).size.height * 148) / 797,
                    (MediaQuery.of(context).size.width * 16) / 390,
                    0),
                child: Container(
                  height: (MediaQuery.of(context).size.height * 78.05) / 797,
                  width: (MediaQuery.of(context).size.width * 357) / 390,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: FFLocalizations.of(context).getText(
                            'ai2vnv38' /* If you have not yet chosen a r... */,
                          ),
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: (MediaQuery.of(context).size.height *
                                            14) /
                                        797 >
                                    (MediaQuery.of(context).size.width * 14) /
                                        390
                                ? (MediaQuery.of(context).size.width * 14) / 390
                                : (MediaQuery.of(context).size.height * 14) /
                                    797,
                            color: Color(0xFFD9DCDE),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'site',
                              ),
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: (MediaQuery.of(context).size.height *
                                                14) /
                                            797 >
                                        (MediaQuery.of(context).size.width *
                                                14) /
                                            390
                                    ? (MediaQuery.of(context).size.width * 14) /
                                        390
                                    : (MediaQuery.of(context).size.height *
                                            14) /
                                        797,
                                color: Color(0xFFD9DCDE),
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.dashed,
                                decorationColor: Color(0xFFD9DCDE),
                                decorationThickness:
                                    (MediaQuery.of(context).size.height * 1) /
                                        797,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    (MediaQuery.of(context).size.width * 16) / 390,
                    0,
                    (MediaQuery.of(context).size.width * 16) / 390,
                    0),
                child: Container(
                  width: (MediaQuery.of(context).size.width * 357) / 390,
                  height: (MediaQuery.of(context).size.height * 53) / 797,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '6i1j2l2u' /* How to use the app? */,
                        ),
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: (MediaQuery.of(context).size.height *
                                            14) /
                                        797 >
                                    (MediaQuery.of(context).size.width * 14) /
                                        390
                                ? (MediaQuery.of(context).size.width * 14) / 390
                                : (MediaQuery.of(context).size.height * 14) /
                                    797,
                            decoration: TextDecoration.underline,
                            color: Color(0xFFD9DCDE),
                            decorationStyle: TextDecorationStyle.dashed,
                            decorationColor: Color(0xFFD9DCDE),
                            decorationThickness:
                                (MediaQuery.of(context).size.height * 1) / 797),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
