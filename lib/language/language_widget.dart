import 'package:auto_size_text/auto_size_text.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LanguageWidget extends StatefulWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  @override
  _LanguageWidgetState createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    (MediaQuery.of(context).size.width * 16) / 360,
                    0,
                    (MediaQuery.of(context).size.width * 16) / 360,
                    0),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: (MediaQuery.of(context).size.width * 360) / 360,
                  height: (MediaQuery.of(context).size.height * 75) / 800,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0, (MediaQuery.of(context).size.height * 100) / 800, 0, 0),
                child: AutoSizeText(
                  FFLocalizations.of(context).getText(
                    'z258brx9' /* Please choose a language */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        fontSize: (MediaQuery.of(context).size.height * 14) /
                                    800 >
                                (MediaQuery.of(context).size.width * 14) / 360
                            ? (MediaQuery.of(context).size.width * 14) / 360
                            : (MediaQuery.of(context).size.height * 14) / 800,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        lineHeight: 20 /
                            ((MediaQuery.of(context).size.width * 14) / 360),
                      ),
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    (MediaQuery.of(context).size.width * 16) / 360,
                    (MediaQuery.of(context).size.height * 12) / 800,
                    (MediaQuery.of(context).size.width * 16) / 360,
                    0),
                child: FFButtonWidget(
                  onPressed: () async {
                    setAppLanguage(context, 'en');
                    await actions.hasBeenPressed(
                      FFAppState().hasBeenPressed1,
                      FFAppState().hasBeenPressed2,
                      FFAppState().hasBeenPressed3,
                      FFAppState().hasBeenPressed4,
                      FFAppState().hasBeenPressed5,
                    );
                    FFAppState().update(() {
                      FFAppState().hasBeenPressed1 = true;
                    });
                  },
                  text: FFLocalizations.of(context).getText(
                    '8swe181o' /* ENGLISH */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: (MediaQuery.of(context).size.height * 48) / 800,
                    color: FFAppState().hasBeenPressed1
                        ? Color(0xFFF4472B)
                        : Color(0x00F4472B),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Inter',
                          color: FFAppState().hasBeenPressed1
                              ? Colors.white
                              : Color(0xFFF4472B),
                          letterSpacing: 0.05 *
                              (MediaQuery.of(context).size.width * 16) /
                              360,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: (MediaQuery.of(context).size.height * 16) /
                                      800 >
                                  (MediaQuery.of(context).size.width * 16) / 360
                              ? (MediaQuery.of(context).size.width * 16) / 360
                              : (MediaQuery.of(context).size.height * 16) / 800,
                          lineHeight: 20 /
                              ((MediaQuery.of(context).size.width * 16) / 360),
                        ),
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      width: (MediaQuery.of(context).size.width * 0.5) / 360,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    (MediaQuery.of(context).size.width * 16) / 360,
                    (MediaQuery.of(context).size.height * 8) / 800,
                    (MediaQuery.of(context).size.width * 16) / 360,
                    0),
                child: FFButtonWidget(
                  onPressed: () async {
                    setAppLanguage(context, 'ru');
                    await actions.hasBeenPressed(
                      FFAppState().hasBeenPressed1,
                      FFAppState().hasBeenPressed2,
                      FFAppState().hasBeenPressed3,
                      FFAppState().hasBeenPressed4,
                      FFAppState().hasBeenPressed5,
                    );
                    FFAppState().update(() {
                      FFAppState().hasBeenPressed2 = true;
                    });
                  },
                  text: FFLocalizations.of(context).getText(
                    '6n6ffivf' /* РУССКИЙ */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: (MediaQuery.of(context).size.height * 48) / 800,
                    color: FFAppState().hasBeenPressed2
                        ? Color(0xFFF4472B)
                        : Color(0x00F4472B),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Inter',
                          color: FFAppState().hasBeenPressed2
                              ? Colors.white
                              : Color(0xFFF4472B),
                          letterSpacing: 0.05 *
                              (MediaQuery.of(context).size.width * 16) /
                              360,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: (MediaQuery.of(context).size.height * 16) /
                                      800 >
                                  (MediaQuery.of(context).size.width * 16) / 360
                              ? (MediaQuery.of(context).size.width * 16) / 360
                              : (MediaQuery.of(context).size.height * 16) / 800,
                          lineHeight: 20 /
                              ((MediaQuery.of(context).size.width * 16) / 360),
                        ),
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      width: (MediaQuery.of(context).size.width * 0.5) / 360,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    (MediaQuery.of(context).size.width * 16) / 360,
                    (MediaQuery.of(context).size.height * 8) / 800,
                    (MediaQuery.of(context).size.width * 16) / 360,
                    0),
                child: FFButtonWidget(
                  onPressed: () async {
                    setAppLanguage(context, 'es');
                    await actions.hasBeenPressed(
                      FFAppState().hasBeenPressed1,
                      FFAppState().hasBeenPressed2,
                      FFAppState().hasBeenPressed3,
                      FFAppState().hasBeenPressed4,
                      FFAppState().hasBeenPressed5,
                    );
                    FFAppState().update(() {
                      FFAppState().hasBeenPressed3 = true;
                    });
                  },
                  text: FFLocalizations.of(context).getText(
                    '9jgt0kph' /* ESPAÑOL */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: (MediaQuery.of(context).size.height * 48) / 800,
                    color: FFAppState().hasBeenPressed3
                        ? Color(0xFFF4472B)
                        : Color(0x00F4472B),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Inter',
                          color: FFAppState().hasBeenPressed3
                              ? Colors.white
                              : Color(0xFFF4472B),
                          letterSpacing: 0.05 *
                              (MediaQuery.of(context).size.width * 16) /
                              360,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: (MediaQuery.of(context).size.height * 16) /
                                      800 >
                                  (MediaQuery.of(context).size.width * 16) / 360
                              ? (MediaQuery.of(context).size.width * 16) / 360
                              : (MediaQuery.of(context).size.height * 16) / 800,
                          lineHeight: 20 /
                              ((MediaQuery.of(context).size.width * 16) / 360),
                        ),
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      width: (MediaQuery.of(context).size.width * 0.5) / 360,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    (MediaQuery.of(context).size.width * 16) / 360,
                    (MediaQuery.of(context).size.height * 8) / 800,
                    (MediaQuery.of(context).size.width * 16) / 360,
                    0),
                child: FFButtonWidget(
                  onPressed: () async {
                    setAppLanguage(context, 'ja');
                    await actions.hasBeenPressed(
                      FFAppState().hasBeenPressed1,
                      FFAppState().hasBeenPressed2,
                      FFAppState().hasBeenPressed3,
                      FFAppState().hasBeenPressed4,
                      FFAppState().hasBeenPressed5,
                    );
                    FFAppState().update(() {
                      FFAppState().hasBeenPressed4 = true;
                    });
                  },
                  text: FFLocalizations.of(context).getText(
                    'jguowibg' /* 日本語 */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: (MediaQuery.of(context).size.height * 48) / 800,
                    color: FFAppState().hasBeenPressed4
                        ? Color(0xFFF4472B)
                        : Color(0x00F4472B),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Inter',
                          color: FFAppState().hasBeenPressed4
                              ? Colors.white
                              : Color(0xFFF4472B),
                          letterSpacing: 0.05 *
                              (MediaQuery.of(context).size.width * 16) /
                              360,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: (MediaQuery.of(context).size.height * 16) /
                                      800 >
                                  (MediaQuery.of(context).size.width * 16) / 360
                              ? (MediaQuery.of(context).size.width * 16) / 360
                              : (MediaQuery.of(context).size.height * 16) / 800,
                          lineHeight: 20 /
                              ((MediaQuery.of(context).size.width * 16) / 360),
                        ),
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      width: (MediaQuery.of(context).size.width * 0.5) / 360,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    (MediaQuery.of(context).size.width * 16) / 360,
                    (MediaQuery.of(context).size.height * 8) / 800,
                    (MediaQuery.of(context).size.width * 16) / 360,
                    0),
                child: FFButtonWidget(
                  onPressed: () async {
                    setAppLanguage(context, 'ar');
                    await actions.hasBeenPressed(
                      FFAppState().hasBeenPressed1,
                      FFAppState().hasBeenPressed2,
                      FFAppState().hasBeenPressed3,
                      FFAppState().hasBeenPressed4,
                      FFAppState().hasBeenPressed5,
                    );
                    FFAppState().update(() {
                      FFAppState().hasBeenPressed5 = true;
                    });
                  },
                  text: FFLocalizations.of(context).getText(
                    'x0c3a2zl' /* عربى */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: (MediaQuery.of(context).size.height * 48) / 800,
                    color: FFAppState().hasBeenPressed5
                        ? Color(0xFFF4472B)
                        : Color(0x00F4472B),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Inter',
                          color: FFAppState().hasBeenPressed5
                              ? Colors.white
                              : Color(0xFFF4472B),
                          letterSpacing: 0.05 *
                              (MediaQuery.of(context).size.width * 16) /
                              360,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: (MediaQuery.of(context).size.height * 16) /
                                      800 >
                                  (MediaQuery.of(context).size.width * 16) / 360
                              ? (MediaQuery.of(context).size.width * 16) / 360
                              : (MediaQuery.of(context).size.height * 16) / 800,
                          lineHeight: 20 /
                              ((MediaQuery.of(context).size.width * 16) / 360),
                        ),
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      width: (MediaQuery.of(context).size.width * 0.5) / 360,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0, (MediaQuery.of(context).size.height * 170) / 800, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePageWidget(),
                      ),
                    );
                  },
                  text: FFLocalizations.of(context).getText(
                    'bmetd3l7' /* OK */,
                  ),
                  options: FFButtonOptions(
                    width: (MediaQuery.of(context).size.width * 214) / 360,
                    height: (MediaQuery.of(context).size.height * 48) / 800,
                    color: Color(0x00F4472B),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Inter',
                          color: FFAppState().hasBeenPressed1 ||
                                  FFAppState().hasBeenPressed2 ||
                                  FFAppState().hasBeenPressed3 ||
                                  FFAppState().hasBeenPressed4 ||
                                  FFAppState().hasBeenPressed5
                              ? Color(0xFFF4472B)
                              : Color(0xFFA5AAAD),
                          letterSpacing: 0.05 *
                              (MediaQuery.of(context).size.width * 16) /
                              360,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: (MediaQuery.of(context).size.height * 16) /
                                      800 >
                                  (MediaQuery.of(context).size.width * 16) / 360
                              ? (MediaQuery.of(context).size.width * 16) / 360
                              : (MediaQuery.of(context).size.height * 16) / 800,
                          lineHeight: 20 /
                              ((MediaQuery.of(context).size.width * 16) / 360),
                        ),
                    borderSide: BorderSide(
                      color: FFAppState().hasBeenPressed1 ||
                              FFAppState().hasBeenPressed2 ||
                              FFAppState().hasBeenPressed3 ||
                              FFAppState().hasBeenPressed4 ||
                              FFAppState().hasBeenPressed5
                          ? Color(0xFFF4472B)
                          : Color(0xFFA5AAAD),
                      width: (MediaQuery.of(context).size.width * 0.5) / 360,
                    ),
                    borderRadius: BorderRadius.circular(10),
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
