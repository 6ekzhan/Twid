import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageWidget extends StatefulWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  @override
  _LanguageWidgetState createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 96, 0, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'z258brx9' /* Please choose a language */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 46, 16, 0),
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
                    setState(() => FFAppState().hasBeenPressed1 = true);
                  },
                  text: FFLocalizations.of(context).getText(
                    '8swe181o' /* ENGLISH */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 48,
                    color: FFAppState().hasBeenPressed1
                        ? Color(0xFFF4472B)
                        : Color(0x00F4472B),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Inter',
                          color: FFAppState().hasBeenPressed1
                              ? Colors.white
                              : Color(0xFFF4472B),
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
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
                    setState(() => FFAppState().hasBeenPressed2 = true);
                  },
                  text: FFLocalizations.of(context).getText(
                    '6n6ffivf' /* РУССКИЙ */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 48,
                    color: FFAppState().hasBeenPressed2
                        ? Color(0xFFF4472B)
                        : Color(0x00F4472B),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Inter',
                          color: FFAppState().hasBeenPressed2
                              ? Colors.white
                              : Color(0xFFF4472B),
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
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
                    setState(() => FFAppState().hasBeenPressed3 = true);
                  },
                  text: FFLocalizations.of(context).getText(
                    '9jgt0kph' /* ESPAÑOL */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 48,
                    color: FFAppState().hasBeenPressed3
                        ? Color(0xFFF4472B)
                        : Color(0x00F4472B),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Inter',
                          color: FFAppState().hasBeenPressed3
                              ? Colors.white
                              : Color(0xFFF4472B),
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    setAppLanguage(context, 'ko');
                    await actions.hasBeenPressed(
                      FFAppState().hasBeenPressed1,
                      FFAppState().hasBeenPressed2,
                      FFAppState().hasBeenPressed3,
                      FFAppState().hasBeenPressed4,
                      FFAppState().hasBeenPressed5,
                    );
                    setState(() => FFAppState().hasBeenPressed4 = true);
                  },
                  text: FFLocalizations.of(context).getText(
                    'jguowibg' /* 日本 */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 48,
                    color: FFAppState().hasBeenPressed4
                        ? Color(0xFFF4472B)
                        : Color(0x00F4472B),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Inter',
                          color: FFAppState().hasBeenPressed4
                              ? Colors.white
                              : Color(0xFFF4472B),
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
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
                    setState(() => FFAppState().hasBeenPressed5 = true);
                  },
                  text: FFLocalizations.of(context).getText(
                    'x0c3a2zl' /* عربى */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 48,
                    color: FFAppState().hasBeenPressed5
                        ? Color(0xFFF4472B)
                        : Color(0x00F4472B),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Inter',
                          color: FFAppState().hasBeenPressed5
                              ? Colors.white
                              : Color(0xFFF4472B),
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
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
                    width: 214,
                    height: 48,
                    color: Color(0x00F4472B),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Inter',
                          color: Color(0xFFA5AAAD),
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                    borderSide: BorderSide(
                      color: Color(0xFFA5AAAD),
                      width: 0.5,
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
