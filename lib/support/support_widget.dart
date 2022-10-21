import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../help/help_widget.dart';
import '../settings/settings_widget.dart';
import '../trip2/trip2_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SupportWidget extends StatefulWidget {
  const SupportWidget({Key? key}) : super(key: key);

  @override
  _SupportWidgetState createState() => _SupportWidgetState();
}

class _SupportWidgetState extends State<SupportWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Color(0xFF002532),
        automaticallyImplyLeading: false,
        title: Text(
          FFLocalizations.of(context).getText(
            'agz50okh' /* СЛУЖБА ПОДДЕРЖКИ */,
          ),
          style: TextStyle(
            fontFamily: 'SF Compact',
            color: FlutterFlowTheme.of(context).primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 552,
                  decoration: BoxDecoration(
                    color: Color(0x00D9DCDE),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/BG_&_logo.png',
                      ).image,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'l0ff1ngm' /* СПАСИБО */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Metal',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    fontSize: 40,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(5, 24, 5, 0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'f25pvfm9' /* Валерий, здравствуйте! Спасибо... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Icon(
                            FFIcons.kmailSUP1,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 128,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Trip2Widget(),
                        ),
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      'ddyicczm' /* OK */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 56,
                      color: Color(0x00F4472B),
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle2
                          .override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).primaryColor,
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
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0x00D9DCDE),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).secondaryColor,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Color(0x00F4472B),
                    borderRadius: 16,
                    borderWidth: 0,
                    buttonSize: 48,
                    fillColor: Color(0x00BE7C71),
                    icon: Icon(
                      FFIcons.kquestion,
                      color: FlutterFlowTheme.of(context).lineColor,
                      size: 24,
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                          reverseDuration: Duration(milliseconds: 0),
                          child: HelpWidget(),
                        ),
                      );
                    },
                  ),
                  FlutterFlowIconButton(
                    borderColor: Color(0x00F4472B),
                    borderRadius: 16,
                    buttonSize: 48,
                    fillColor: Color(0x00BE7C71),
                    icon: Icon(
                      FFIcons.ksettings,
                      color: FlutterFlowTheme.of(context).lineColor,
                      size: 24,
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                          reverseDuration: Duration(milliseconds: 0),
                          child: SettingsWidget(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
